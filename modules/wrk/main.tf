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
  name        = "dev.wrk.danivy.com"
  nat_network = "wrk"
  template    = "C:\\vms\\templates\\ansible-development-echo\\ansible-development-echo.ovf"
}
