# terraform-aws-study

## Usage

### Initialize working directory
```sh
$ make init
```

### Provision plan
```sh
$ make plan
```

### Provision
```sh
$ make provision
```

### Update kubeconfig
```sh
$ make kubeconfig
```

### Switch context to EKS
```sh
$ make switch-context
```

### Create configmap/aws-auth
```sh
$ make aws-auth
```

### Destroy plan
```sh
$ make destroy-plan
```

### Destroy
```sh
$ make destroy
```

## Specify working directory

The default working directory is `dev`. You can specify other working directory for most commandes.  

Exsample:
```sh
$ make init env=stg
```
