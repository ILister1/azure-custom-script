#!/bin/bash

az group create -n mygroup -l uksouth

az vm create \
  --resource-group mygroup \
  --name myVM \
  --image UbuntuLTS \
  --admin-username idl-dev \
  --generate-ssh-keys \

az vm open-port --resource-group mygroup --name myVM --port 80

az vm extension set \
  --resource-group mygroup \
  --vm-name myVM \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --protected-settings '{ "script": "IyEvYmluL2Jhc2gKCnN1ZG8gYXB0IHVwZGF0ZQpzdWRvIGFwdCBpbnN0YWxsIGdpdApjdXJsIGh0dHBzOi8vZ2V0LmRvY2tlci5jb20gfCBzdWRvIGJhc2gKCnN1ZG8gYXB0IGluc3RhbGwgLXkgY3VybCBqcQojIHNldCB3aGljaCB2ZXJzaW9uIHRvIGRvd25sb2FkIChsYXRlc3QpCnZlcnNpb249JChjdXJsIC1zIGh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvZG9ja2VyL2NvbXBvc2UvcmVsZWFzZXMvbGF0ZXN0IHwganEgLXIgJy50YWdfbmFtZScpCiMgZG93bmxvYWQgdG8gL3Vzci9sb2NhbC9iaW4vZG9ja2VyLWNvbXBvc2UKc3VkbyBjdXJsIC1MICJodHRwczovL2dpdGh1Yi5jb20vZG9ja2VyL2NvbXBvc2UvcmVsZWFzZXMvZG93bmxvYWQvJHt2ZXJzaW9ufS9kb2NrZXItY29tcG9zZS0kKHVuYW1lIC1zKS0kKHVuYW1lIC1tKSIgLW8gL3Vzci9sb2NhbC9iaW4vZG9ja2VyLWNvbXBvc2UKIyBtYWtlIHRoZSBmaWxlIGV4ZWN1dGFibGUKc3VkbyBjaG1vZCAreCAvdXNyL2xvY2FsL2Jpbi9kb2NrZXItY29tcG9zZQoKZ2l0IGNsb25lIGh0dHBzOi8vZ2l0bGFiLmNvbS9xYWNkZXZvcHMvY2hhcGVyb290b2RvX2NsaWVudC5naXQKY2QgY2hhcGVyb290b2RvX2NsaWVudApzdWRvIGRvY2tlci1jb21wb3NlIHVwIC1kCg==" }'


