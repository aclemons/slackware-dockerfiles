#!/usr/bin/env groovy

// Copyright 2019-2020 Andrew Clemons, Wellington New Zealand
// All rights reserved.
//
// Redistribution and use of this script, with or without modification, is
// permitted provided that the following conditions are met:
//
// 1. Redistributions of this script must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
//  THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
//  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
//  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
//  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
//  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
//  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

node('master') {
    stage('build') {
        checkout scm

        ansiColor('xterm') {
            def baseImage = env.BASE_IMAGE
            if (baseImage == null) {
                baseImage = 'vbatts/slackware:14.2'
            }

            def localMirror = env.LOCAL_MIRROR
            if (localMirror != null) {
                def version = sh(returnStdout: true, script: "basename ${localMirror}").trim()

                dir("local_mirrors") {
                    sh("rm -rf ${version}")
                    sh("ln -s ${localMirror}")
                }

                sh("bash scripts/sync_local_mirror.sh ${version}")

                dir("local_mirrors") {
                    sh("unlink ${version}")
                    sh("cp -a ${localMirror} .")
                }

                localMirror = "local_mirrors/${version}"
            }

            def args = "--build-arg base_image=${baseImage} --no-cache"

            if (localMirror != null) {
                args = "${args} --build-arg local_mirror=${localMirror}"
            }

            docker.build(env.DOCKER_IMAGE, "${args} .")

            deleteDir()
        }
    }
}
