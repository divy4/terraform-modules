resource "null_resource" "ramdisk" {
  triggers = {
    filesystem = var.filesystem
    letter     = var.letter
    size       = var.size
  }

  provisioner "local-exec" {
    # Definitely very ugly, but at least it runs the command as admin
    command     = "powershell -WindowStyle Hidden \"imdisk -a -s ${self.triggers.size} -m ${self.triggers.letter}: -p '/fs:${self.triggers.filesystem} /q /y'\""
    interpreter = ["powershell", "Start-Process", "-Wait", "-PassThru", "-Verb", "runAs"]
  }

  provisioner "local-exec" {
    command     = "imdisk -D -m ${self.triggers.letter}:"
    interpreter = ["powershell", "-Command"]
    when        = destroy
  }
}
