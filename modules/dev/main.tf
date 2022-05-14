module "vm" {
  source      = "../../child_modules/vm"
  folder      = "C:\\vms\\"
  fullscreen  = true
  mac_address = "000100000001"
  name        = "dev.dev.danivy.com"
  nat_network = "dev"
  template    = "C:\\vms\\templates\\ansible-development\\ansible-development.ovf"
}
