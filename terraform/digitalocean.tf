provider "digitalocean" {
  token = "${var.do_api_token}"
}

provider "aws" {
  alias = "ubxd"

  access_key = "${var.aws_key}"
  secret_key = "${var.aws_secret}"

  region = "us-east-1"
}

resource "digitalocean_droplet" "monitor1" {
    image = "ubuntu-14-04-x64"
    name = "monitor1"
    region = "lon1"
    size = "1gb"
    ssh_keys = [307489,407582]
}

resource "aws_route53_record" "monitor1" {
  provider = "aws.ubxd"
  zone_id = "Z3PI72UHF494G2"
  name = "monitor1.ubxd.io"
  type = "A"
  ttl = "300"
  records = ["${digitalocean_droplet.monitor1.ipv4_address}"]
}
