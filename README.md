# Arbitrary Metrics Box

This repository will provision a Vagrant with Graphite that can accept arbitrary metrics.

## How to Provison

* Clone this repository
* Run the following commands

bash```
cd arbitrary-metrics-box
vagrant up
```

## How to Push Metrics

Run `put_metric.sh` script in this repo with arguments.

This script uses `nc` command to submit metrics.

E.G

bash```
./put_metric.sh -m test_metric -v 10
```

## Accessing the Interface

Go to http://localhost:8080 on your browser.

## Destroy Vagrant Box

Run the following command

bash```
vagrant destroy
```
