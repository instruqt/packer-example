source "googlecompute" "instruqt_image" {
  
  # Modify
  project_id   = "GCP_PROJECT_ID"

  # Modify where desired
  image_name   = "instruqt-image-01"
  source_image = "ubuntu-2204-jammy-v20221101a"
  disk_size    = "10"
  ssh_username = "root"

  # Do not modify
  account_file = "instruqt.json"
  region       = "europe-west1"
  zone         = "europe-west1-b"
}

# Example provisioners
build {
  sources = ["source.googlecompute.instruqt_image"]

  # All files in the "files" directory will be copied to the image
  provisioner "file" {
    source = "files/"
    destination = "/root"
  }
  
  # The Nginx package will be installed on the image
  provisioner "shell" {
    inline = ["apt update && apt install nginx -y"]
  }

}
