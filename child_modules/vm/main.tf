# TODO: Switch to terraform provider or use another hypervisor
resource "null_resource" "vm" {
  triggers = {
    folder      = var.folder
    mac_address = var.mac_address
    name        = var.name
    nat_network = var.nat_network
    template    = var.template
  }

  provisioner "local-exec" {
    command     = <<-EOF
      set -euo pipefail
      VBoxManage import ${self.triggers.template} --vsys 0 --vmname ${self.triggers.name} --basefolder ${self.triggers.folder}
      VBoxManage modifyvm ${self.triggers.name} --nic1 natnetwork --nat-network1 ${self.triggers.nat_network} --macaddress1 ${self.triggers.mac_address}
      VBoxManage setextradata ${self.triggers.name} GUI/Fullscreen ${var.fullscreen}
      VBoxManage startvm ${self.triggers.name}
      VBoxManage controlvm ${self.triggers.name} setvideomodehint 3440 1440 100
    EOF
  }

  provisioner "local-exec" {
    command     = <<-EOF
      set -euo pipefail
      if VBoxManage list runningvms | grep --quiet '^"${self.triggers.name}"'; then
        VBoxManage controlvm ${self.triggers.name} poweroff
        sleep 1
      fi
      VBoxManage unregistervm ${self.triggers.name} --delete
    EOF
    when        = destroy
  }
}
