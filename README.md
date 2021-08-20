# Telegraf 
#### Only includes Telegraf

# Telegraf alpine 
#### Contains:
- Telegraf
- SNMP tools
- IPMITOOL
- MIB Files

```
Sophos XG MIB for v17 and v18: https://docs.sophos.com/nsg/sophos-firewall/MIB/SOPHOS-XG-MIB.zip
```

> Set TELEGRAF_CONFIG_PATH environment variable for configuration.

# Build & Push example:

```
.\build.cmd 1.19.3
.\push.cmd 1.19.3
```

