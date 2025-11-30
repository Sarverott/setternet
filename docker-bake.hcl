


group "default" {
    targets = ["core"]
}

variable "author" {
    default = {
        user="sarverott",
        fullname="Sett Sarverott",
        mail="sarverott@gmail.com"
    }
}

variable "base" {
    default = ""
}

variable "project" {
    default = "setternet"
}

variable "GRIH" {
    default = [
        0,
        1,
        0,
        0
    ]
}

function "versioning" {
    params = [
      grihForm
    ]
    result = join(".", grihForm)
}

function "repository" {
    params = [
        user, 
        package
    ]
    result = "${user}/${package}"
}

function "tagsgen" {
    params = [target]
    result = [
        "${repository(author.user, project)}:v${versioning(GRIH)}",
        //"${repository(publisher, project)}:UNIXUSAT${unixusat}",
        "${repository(author.user, project)}:latest"
    ]
}


target "core" {
    labels = {
        "org.opencontainers.image.source" = "https://github.com/${author.user}/${project}"
        "org.opencontainers.image.author" = author.mail
    }
    context = "."
    //contexts = {
        //pinned_alpine = base
        // docs = "./docs"
        // context = "."
        // tags = "sarverott/setternet"
    //}
    tags = tagsgen("core")
}

// target "office_host" {
//   contexts = {
//     docs = "./docs"
//     context = "."
//     tags = "sarverott/setternet"
//   }
// }

// target "federation_unit" {
//   contexts = {
//     docs = "./docs"
//     context = "."
//     tags = "sarverott/setternet"
//   }
// }

// target "unithost" {
//   contexts = {
//     docs = "./docs"
//     context = "."
//     tags = "sarverott/setternet"
//   }
// }

// target "gateway" {
//   contexts = {
//     docs = "./docs"
//     context = "."
//     tags = "sarverott/setternet"
//   }
// }

// target "endpoint" {
//   contexts = {
//     docs = "./docs"
//     context = "."
//     tags = "sarverott/setternet"
//   }
// }

// target "core" {
//   contexts = {
//     docs = "./docs"
//     context = "."
//     tags = "sarverott/setternet"
//   }
// }