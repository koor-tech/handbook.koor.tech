---
title: Troubleshooting Strategy
---

This document describes the troubleshooting strategy while we’re investigating a problem in the rook-ceph cluster in a production environment.

## Part 1 - Understanding the Problem

* Understand the criticality of the problem if its impacting the production environment/
* Understand the customer's architecture and workload if it's a recommended configuration.
* Gather the [koor-gather-info](https://github.com/koor-tech/koor-gather-info) zip file to get the basic information to troubleshoot the problem.
    * The zip file will be stored under `/tmp` by default (`mktemp` is used to get a "temporary" directory on the host running the script).
* Understand and WRITE DOWN the Rook and Ceph versions.
    * Rook Operator version: `kubectl get -n rook-ceph deployments.apps rook-ceph-operator -o jsonpath='{.spec.template.spec.containers[0].image}'`
    * In the toolbox Pod: `ceph versions`
* Ask the customer about the timeline and chronology of the sequence of events which lead to the issue.
* Ask if the customer has made any non-default configuration changes in their environment.
* Get a clear idea to briefly narrow down on which layer the issue is.

## Part 2 - Investigation of the problem

* Check for any known issues in the upstream release notes for the versions related to the problem description.
* Start with the investigation of the logs based on the problem.
    * Check the rook-ceph-operator Pod logs and other information collected in the koor-gather-info zip file.
    * If any more information is needed which is not collected as a part of the koor-gather-info zip file, ask the customer.
        * If we think that the information or command outputs we need are essential for every investigation, open an issue on the koor-gather-info github repository and contribute to [GitHub koor-tech/koor-gather-info](https://github.com/koor-tech/koor-gather-info) to make sure we have it added for future usage and issue investigation.
    * Check for Ceph components logs if the issue could be on a lower Ceph storage layer.
* Understand if the problem occurred due to
    * A known issue
    * Or its a new bug
    * Or its due to the current behavior of Rook and Ceph

## Part 3 - Triaging and recommending a solution

* Based on the understanding and investigation of the problem we need to recommend a solution or a workaround to fix the problem.
* Open an issue in the Rook upstream repository or Koor Storage Distribution repository based on the version that the customer is using.
    * Raise a tracker on [https://tracker.ceph.com/](https://tracker.ceph.com/) if it's an issue with the underlying Ceph component and follow up with the respective component team in the upstream community meetings.
    * Ask for a workaround or a solution based on the problem
* Assure the customer based on the criticality of the problem that we’re there to help them and find a solution for their problem.
* Based on the final investigation, provide a way for the customer to fix their problem.
* Create a knowledge base for the problem in our documentation.
* Check if our documentation can be improved from a user perspective to understand if the problem can be avoided just by following our documentation for better usability and understanding of our product.
