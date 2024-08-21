name: proxmoxve-container
runtime: yaml

resources:
  plexmetContainer:
    type: proxmoxve:CT:Container
    properties:
      target_node: "pms1"
      name: "plexmet"
      hostname: "plexmet.hughesco.org"
      ostemplate: "PMS1.Datastore/debian-12-standard_12.2-1_amd64.tar.zst" # Adjust as necessary
      vmid: 1210
      rootfs:
        storage: "PMS1.Datastore:1210/vm-1210-disk-0.raw"
        size: "8G"
      memory: 1024
      swap: 1024
      cpu: 
        cores: 4
        sockets: 1
      cpulimit: 4  # Set the CPU cores limit to 4
      cpuunits: 100
      netifs:
        - name: "eth0"
          bridge: "vmbr01"
          firewall: false
          gw: "10.1.2.1"
          ip: "10.1.2.10/26"
          tag: 2
      features:
        nesting: true
      cmode: "console"
      tty: 2
      protection: true
      arch: "amd64"
      ostype: "debian"
      onboot: true
      unprivileged: false
      nameserver: "10.1.1.2"
