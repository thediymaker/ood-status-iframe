require 'sinatra'
require 'ood_core'

begin
  CLUSTERS = OodCore::Clusters.new(OodCore::Clusters.load_file(ENV['OOD_CLUSTERS'] || '/etc/ood/config/clusters.d').select(&:job_allow?)
    .select { |c| c.job_config[:adapter] == "slurm" }
    .reject { |c| c.metadata.hidden }
    .sort_by {|cluster| [cluster.metadata.priority.to_i, cluster.id]}
  )
rescue OodCore::ConfigurationNotFound
  CLUSTERS = OodCore::Clusters.new([])
end

helpers do
  def dashboard_title
    ENV['OOD_DASHBOARD_TITLE'] || "Open OnDemand"
  end

  def dashboard_url
    "/pun/sys/dashboard/"
  end

  def public_url
     ENV['OOD_PUBLIC_URL'] || "/public"
  end

  def app_version
    @app_version ||= (version_from_file(settings.root) || version_from_git(settings.root) || "").strip
  end

  def version_from_file(dir)
    file = Pathname.new(dir).join("VERSION")
    file.read if file.file?
  end

  def version_from_git(dir)
    Dir.chdir(Pathname.new(dir)) do
      version = `git describe --always --tags 2>/dev/null`
      version.to_s.strip.empty? ? nil : version
    end
  rescue Errno::ENOENT
    nil
  end
end

get '/clusters' do
  @clusters = CLUSTERS.map { |cluster|
    SlurmSqueueClient.new(cluster).setup
  }
  @gpustats = CLUSTERS.map { |cluster|
    GPUClusterStatusSlurm.new(cluster)
  }
  @error_messages = (@clusters.map{ |cluster| cluster.friendly_error_message}).compact
  erb :index
end

# 404 not found
not_found do
  erb :'404'
end

# 500 internal server error
error do
  erb :'500'
end
