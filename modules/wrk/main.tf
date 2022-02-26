module "ramdisk" {
  source     = "../../child_modules/ramdisk"
  filesystem = "ntfs"
  letter     = "T"
  size       = "16G"
}

