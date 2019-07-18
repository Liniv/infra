#!/bin/bash
scp -r /etc/kubernetes/pki 10.90.2.51:/etc/kubernetes/ \
&& scp -r /etc/kubernetes/pki 10.90.2.61:/etc/kubernetes/