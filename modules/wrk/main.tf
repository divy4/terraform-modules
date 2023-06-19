module "vm" {
  source      = "../../child_modules/vm"
  folder      = "/tmp/vms"
  fullscreen  = true
  mac_address = "000401000001"
  name        = "dev.wrk.danivy.com"
  nat_network = "wrk"
  template    = "~/vms/templates/ansible-development-echo/ansible-development-echo.ovf"
}
