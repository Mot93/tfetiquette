# env0
This environment exists only to share via it's output informations that will be used by other terraform instances.

Its outputs are accessible using the terraform `terraform_remote_state`.

## Why?
Especially when building a big infrastructure it might happen that multiple part of it are managed by multiple instances of terraform.

Sharing values via outputs syncs all istances in usign the same shared configurations.

It's also extremely practical when some instances are sequential one to the other.
