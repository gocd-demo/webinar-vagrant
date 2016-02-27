# Vagrant based instance of GoCD used for webinars

This project is used to set up a GoCD server to be used for webinars and demos. It contains working pipelines that show multiple stages, pipeline dependencies and other features of GoCD. The instance is a full working instance of GoCD, but the pipelines themselves are simulated.

# Prerequisites

You'll need the following installed to use this

* Git (to clone this repo)
* Vagrant
* Virtualbox

No specific versions have been identied as required, but it's probably a good idea to have a fairly recent version regardless.

# Setting it up

* Clone this repo
* In a terminal, enter the vagrant-webinar directory
* Type 'vagrant up'
  * This step could take a while depending on the speed of your internet connection. When it's done you'll be returned to the command line.

# Usage

* Open your web browser and navigate to http://localhost:8153/
* You should see a number of pipelines on a GoCD instance. (see known issues below if you don't)

# Known issues

On occasion the config file isn't copied into place automatically, no idea why. If that happens, the cruise-config.xml from this repo can be copied into the new server by editing the XML at http://localhost:8153/go/admin/config_xml on your machine. To do this, copy everything _below_ the <server line in the included file and replace everything below your <server line in the XML.



