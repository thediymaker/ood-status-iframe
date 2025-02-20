# Open OnDemand iFrame App

This is a simplified python iframe app and allows for easy streamlining of an iframe in your Open OnDemand instance. It allows you to do things like embed an external dashboard (such as the [Slurm Dashboard](https://github.com/thediymaker/slurm-node-dashboard)) within your Open OnDemand interface.

## Features

- Lightweight Python App
- Embeds external sites using an iFrame
- Easy to install and configure

## Prerequisites

- Open OnDemand installation
- Python3

## Installation

1. Clone this repository into the Open OnDemand apps directory:

```bash
cd /var/www/ood/apps/sys/
git clone https://github.com/thediymaker/ood-status-iframe.git
cd ood-status-iframe
```
2. Create a virtual environment and install requirements

```bash
python3 -m venv ood-status-iframe
source ood-status-iframe/bin/activate
python3 -m pip install -r requirements.txt
```

3. If you updated the name of the envionment, you will need to modify the path in the bin/python file to match. Also you need ot make sure the bin/python file is executable.

```bash
chmod +x bin/python
```

## Configuration

1. Open the `templates/layout.html` file in your preferred text editor.

2. Update the URL in the iFrame to point to your external dashboard:

```erb
<iframe src="https://your-external-dashboard-url.com" ...>
```

3. Update the mainifest.yml to reflect the application name and location in the menu that you would like this app to appear.

```yml
name: System Status
description: |-
   HPC Status Page
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
4. Restart the "Web server" from the help menu in the top right of the dashboard.

## Usage

Once installed and configured, users can access the embedded dashboard through the Open OnDemand interface. The external page will be displayed within an iFrame in the Open OnDemand UI.

## Troubleshooting

If you encounter issues:

- Check that the app directory permissions are correct, this is a common one, if your app doesnt show up in the browser, its either an issue with permissions or the local user webserver needs a restart.
- Review Open OnDemand, and system logs for any error messages.

## Contributing

Contributions to improve this app are welcome. Please submit issues and pull requests on the GitHub repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Developed for integration with [HPC Dashboard](https://github.com/thediymaker/slurm-node-status) and similar external monitoring tools

For more information or support, please open an issue on the GitHub repository.