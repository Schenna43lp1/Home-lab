Stand: 02.05.2026

## Ziel

Backblaze B2 wird als S3-kompatibles Offsite-Backup-Ziel für Proxmox Backup Server verwendet.

## Backblaze Bucket

| Feld | Wert |
|---|---|
| Bucket | `pvebackup-markushome` |
| Region | `eu-central-003` |
| S3 Endpoint | `s3.eu-central-003.backblazeb2.com` |
| Port | `443` |
| SSL | aktiv |

## Application Key

Für PBS wird ein eigener Backblaze Application Key verwendet.

Empfohlene Einstellungen:

| Einstellung | Wert |
|---|---|
| Name | `pbs01` |
| Bucket Access | `pvebackup-markushome` |
| Type of Access | `Read and Write` |
| Allow List All Bucket Names | aktiviert |
| File Name Prefix | leer |
| Duration | leer |

## PBS S3 Endpoint

In PBS muss der Endpoint so konfiguriert werden:

| Feld | Wert |
|---|---|
| Endpoint | `s3.eu-central-003.backblazeb2.com` |
| Region | `eu-central-003` |
| Port | default / `443` |
| Path Style | aktiviert |
| Skip If-None-Match header | aktiviert |
| DeleteObjects via deleteObject | deaktiviert |
| Fingerprint | leer |

## Credentials

| PBS-Feld | Backblaze-Wert |
|---|---|
| Access Key | `keyID` |
| Secret Key | `applicationKey` |

> Wichtig: Der `applicationKey` darf nicht ins Git-Repo geschrieben werden.

## Typische Fehler

### 405 Method Not Allowed

Ursachen:

- Endpoint unvollständig
- falscher Endpoint
- Bucketname im Endpoint
- Path Style deaktiviert
- falscher Key

Korrekt:

```text
s3.eu-central-003.backblazeb2.com