patch-management Cookbook
=========================
Ensures specified packages are installed and patched.

Requirements
------------
### Platform:

* Tested on CentOS 6.5
* Tested on Ubuntu 12.04 LTS
* Should work on a wide variety of other *nix systems


Attributes
==========

packages
--------

Hash of packages and their associated minimum version.

Example:

```ruby
node.default['patch-management']['packages'] = {'httpd' => '2.2.15-39.el6', 'bash' => '4.1.2-29.el6'}
```

Modules
=======

### PatchManagement::Helper

Provides a handful of abstracted helper functions for evaluating installed packages.

* pkg_installed?(pkg) -- returns true if specified package is installed

* pkg_version(pkg) -- returns the currently installed version of specified package

* pkg_newer?(ver1,ver2) -- returns true if "ver1" is greater than or equal to "ver2"

Recipes
=======

### patch-management::default

* Audits and remediates over specified packages/versions.

### patch-management::audit

* Iterates through the hash specified in node['patch-management']['packages'] and sets a node['patch-management']['patched'] boolean to true if all packages are installed and of the correct version or later, or false if any are not present, or of a version different than the one specified in the attribute hash.


### patch-management::remediate

* Iterates through the hash specified in node['patch-management']['packages'] and ensures that the packages contained theirein are installed and at least the version specified in the hash. Installs packages that aren't present, upgrades those that are below the specified version. 

* Will re-run patch-managment::audit to ensure that node['patch-management']['patched'] is properly set.

Usage
-----
#### patch-management::default

Include `patch-management` in your node's `run_list`, and be sure to set the "packages" hash for your node/role/etc.

Example:

```json
{
  "patch-management": {
    "packages": {
      "httpd": "2.2.15-39.el6",
      "bash": "4.1.2-29.el6"
    }
  }
}
```

Once the cookbook is in all appropriate servers' run-lists, you can use the node['patch-management']['patched'] attribute to determine which machines have passed/failed their audits.

Example:

```bash
$ knife search node "patched:false"
```

License and Author
------------------

Author:: Chef Software, Inc (support@getchef.com)  
Author:: Nicolas Rycar (nrycar@getchef.com)  
Author:: Andre Elizondo (andre@getchef.com) 

Copyright:: 2014, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
