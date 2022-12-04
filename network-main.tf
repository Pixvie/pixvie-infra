resource "google_compute_firewall" "http-server" {
    name = "http-server"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["80"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["http-server"]
  
}

resource "google_compute_firewall" "https-server" {
    name = "https-server"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["443"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["https-server"]

}

resource "google_compute_firewall" "allow-all" {
    name = "allow-all"
    network = "default"
    allow {
        protocol = "all"
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["allow-all"]
}