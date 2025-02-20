from flask import Flask, render_template

MyApp = Flask(__name__)

@MyApp.route("/")
def index():
    dashboard_url = "/"
    dashboard_title = "Dashboard"
    return render_template("layout.html", dashboard_url=dashboard_url, dashboard_title=dashboard_title)

if __name__ == "__main__":
    MyApp.run()