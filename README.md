# packer-example
Template repository for creating images using Packer

## Modifying the packer.pkr.hcl file

The `packer.pkr.hcl` file includes several parameters that can be modified to edit your image:

```
  # Modify 
  project_id   = "GCP_PROJECT_ID"                 <------- Change to your own Google Cloud Project ID

  # Modify where desired
  image_name   = "instruqt-image-01"              <------- Name Instruqt will use to reference your image
  source_image = "ubuntu-2204-jammy-v20221101a"   <------- Default is Ubuntu 22.04, but feel free to change this
  disk_size    = "10"                             <------- Disk size in Gb
```

Furthermore, you can edit/add your own provisioners to the file: 

```
  # All files in the "files" directory will be copied to the image
  provisioner "file" {
    source = "files/"
    destination = "/root"
  }
  
  # The Nginx package will be installed on the image
  provisioner "shell" {
    inline = ["apt update && apt install nginx -y"]
  }
```

Check out the Packer Documentation for more information: https://developer.hashicorp.com/packer/docs

## Automating this template even further

By default, this template is only configured to generate images whenever you manually run the *Packer* GitHub Action. 
You can modify the `.github/workflows/packer.yml` file to trigger image creation in different ways. 

For example, to trigger image creation every time there is a push to the `main` branch, you can use the following configuration:

```
on:
  push:
    branches:
      - main
```
