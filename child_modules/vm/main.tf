# Yes, I know there is a VirtualBox module in the registry.
# But it doesn't support Windows right now and I didn't have the time to help
# them add that support.

resource "null_resource" "vm" {
  triggers = {
    folder      = var.folder
    name        = var.name
    nat_network = var.nat_network
    template    = var.template
  }

  provisioner "local-exec" {
    command     = <<-EOF
      VBoxManage import ${self.triggers.template} --vsys 0 --vmname ${self.triggers.name} --basefolder ${self.triggers.folder}
      VBoxManage modifyvm ${self.triggers.name} --nic1 natnetwork --nat-network1 ${self.triggers.nat_network}
      VBoxManage startvm ${self.triggers.name}
    EOF
    interpreter = ["powershell", "-Command"]
  }

  provisioner "local-exec" {
    command     = <<-EOF
      VBoxManage controlvm ${self.triggers.name} poweroff
      Start-Sleep 1
      VBoxManage unregistervm ${self.triggers.name} --delete
    EOF
    interpreter = ["powershell", "-Command"]
    when        = destroy
  }
}
