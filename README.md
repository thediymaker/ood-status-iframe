# Open OnDemand iFrame App

This is a simplified version of the OSC Status App, streamlined to provide essential functionality for embedding an iframe in your Open OnDemand instance. It allows you to embed an external dashboard (such as the [Slurm Dashboard](https://github.com/thediymaker/slurm-node-dashboard)) within your Open OnDemand interface.

## Features

- Lightweight Ruby app for Open OnDemand
- Embeds external dashboards using an iFrame
- Easy to install and configure

## Prerequisites

- Open OnDemand installation

## Installation

1. Clone this repository into the Open OnDemand apps directory:

```bash
cd /var/www/ood/apps/sys/
git clone https://github.com/thediymaker/ood-status-iframe.git
```
2. set permissions on the directory, for example, 755

```bash
chmod -R 755 ood-status-iframe
```

3. Configure the bundle path and run setup to verify functionality:

```bash
cd ood-status-iframe
bin/bundle config --local --path vendor/bundle
bin/setup
```

## Configuration

1. Open the `views/layout.erb` file in your preferred text editor.

2. Update the URL in the iFrame to point to your external dashboard:

```erb
<iframe src="https://your-external-dashboard-url.com" ...>
```

3. Update the mainifest.yml to reflect the application name and location in the menu that you would like this app to appear.

```yml
name: System Status
description: |-
   HPC node status
category: System
subcategory: System Information
icon: fa://bar-chart
show_in_menu: true
```

## Verification

To verify that the app is working correctly:

1. Ensure that Open OnDemand can access the app directory.
2. Restart the Open OnDemand service if necessary.
3. Log in to your Open OnDemand instance and look for the new app in the available apps list.

## Usage

Once installed and configured, users can access the embedded dashboard through the Open OnDemand interface. The external dashboard will be displayed within an iFrame in the Open OnDemand UI.

## Troubleshooting

If you encounter issues:

- Check that the app directory permissions are correct, this is a common one, if your app doesnt show up in the browser, its either an issue with permissions or the local user webserver needs a restart.
- Verify that the URL in `views/layout.erb` is accessible by the user and the Open OnDemand server.
- Review Open OnDemand, and system logs for any error messages.

## Contributing

Contributions to improve this app are welcome. Please submit issues and pull requests on the GitHub repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Based on the [OSC Status App](https://github.com/OSC/osc-systemstatus)
- Developed for integration with [HPC Dashboard](https://github.com/thediymaker/slurm-node-status) and similar external monitoring tools

For more information or support, please open an issue on the GitHub repository.