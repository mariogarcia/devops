resource "libvirt_network" "tf" {
  name      = "tf"
  domain    = "tf.local"
  addresses = ["192.168.1.50/28"]

  dns {
    hosts {
      hostname = "local-dns"
      ip       = "192.168.1.1"
    }

    hosts {
      hostname = "google-dns-1"
      ip       = "8.8.8.8"
    }

    hosts {
      hostname = "google-dns-2"
      ip       = "8.8.4.4"
    }
  }
}