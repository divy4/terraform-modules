variable "letter" {
  description = "The drive letter of the ramdisk"
  type        = string
}

variable "size" {
  description = "The size of the ramdisk"
  type        = string
}

variable "filesystem" {
  description = "The filesystem type the ramdisk should use"
  type        = string
}
