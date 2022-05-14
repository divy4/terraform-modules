module "ramdisk" {
  source     = "../../child_modules/ramdisk"
  filesystem = "ntfs"
  letter     = "T"
  size       = "16G"
}

module "vm" {
  depends_on  = [module.ramdisk]
  source      = "../../child_modules/vm"
  folder      = "T:\\vms\\"
  fullscreen  = true
  mac_address = "000400000001"
  name        = "dev.wrk.danivy.com"
  nat_network = "wrk"
  template    = "C:\\vms\\templates\\ansible-development-echo\\ansible-development-echo.ovf"
}
