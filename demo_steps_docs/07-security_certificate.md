# Certificates

The goal: inspect real certificates content, generate a sample one

1. Certificates are used to identify an Entity. To prove the identification, there is a certificate chain: leaf, intermediate, and root certs.

    - open any website and show certificate: subject, alternative names, valid to/from, trust-chain
    - get certificate from terminal and compare : `echo | openssl s_client -servername github.com -connect github.com:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > certificate.crt`

    By default, your browser accepts certificates that have trusted Certificate Authority in its trust-chain. You can _trust_ other authoirities too, but you have to add them to truststore first.

    Certificates could be self-signed - no CA verified it.

    Certificates have expiration dates. Root certificates often are valid 10+ years, while leaf certificates - less than a year.

2. Create a sample Certificate Authority and sign a certificate.

```sh
# root certificate:
openssl genrsa -out root.key 2048

openssl req -x509  -new -nodes \
    -key root.key \
    -days 3650 \
    -out root.pem \
    -subj "/C=UA/CN=CloudComputing"

# to read certificate content:
openssl x509 -text -noout -in root.pem

# leaf private key
openssl genrsa -out leaf.key 2048

# leaf certificate request
openssl req -new -key leaf.key \
    -out leaf.csr \
    -subj "/C=UA/CN=example.com"

openssl req -noout -text -in leaf.csr

openssl x509 -req \
    -in leaf.csr \
    -extensions server_ext \
    -CA root.pem \
    -CAkey root.key \
    -CAcreateserial \
    -out leaf.crt \
    -days 365 \
    -extfile \
    <(echo "[server_ext]"; echo "extendedKeyUsage=serverAuth,clientAuth"; echo "subjectAltName=DNS.1:example.com,DNS.2:*.example.com")

openssl x509 -text -noout -in leaf.crt
```

## Further reading:

- [Illustrated X.509 Certificate](https://darutk.medium.com/illustrated-x-509-certificate-84aece2c5c2e)
- [Public Key Infrastructure](https://smallstep.com/blog/everything-pki/)
