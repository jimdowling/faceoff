name             'faceoff'
maintainer       "faceoff"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs faceoff'
version          "0.1"

recipe            "faceoff::install", "Experiment setup for faceoff"
recipe            "faceoff::experiment",  "configFile=; Experiment name: experiment"


depends "kagent"



%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "faceoff/version",
:description => "Version of faceoff",
:type => 'string',
:default => "0.1"


attribute "faceoff/url",
:description => "Url to download binaries for faceoff",
:type => 'string',
:default => ""

attribute "faceoff/user",
:description => "Run faceoff as this user",
:type => 'string',
:default => "faceoff"

attribute "faceoff/group",
:description => "group parameter value",
:type => "string"

attribute "faceoff/user",
:description => "user parameter value",
:type => "string"


