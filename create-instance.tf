resource "google_compute_address" "static-ip-address" {
  name = "static-ip-address"
}

resource "google_compute_instance" "default" {
    name = "pixvie-vm"
    machine_type = "e2-medium"
    zone = "europe-west3-c"

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
            size = 20
        }
    }

    network_interface {
        network = "default"
        access_config {
            nat_ip = "${google_compute_address.static-ip-address.address}"
        }
    }

    metadata = {
        ssh-keys = "pixvie:${file("~/.ssh/id_rsa.pub")}"
    }

    metadata_startup_script = file("setup_jenkins.sh")

    tags = [ "http-server", "https-server", "allow-all" ]
}

output "ip" {
    value = "${google_compute_instance.default.network_interface[0].access_config[0].nat_ip}"
}