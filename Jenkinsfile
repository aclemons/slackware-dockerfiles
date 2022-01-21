#!/usr/bin/env groovy

// Copyright 2019-2022 Andrew Clemons, Wellington New Zealand
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

            def args = "--build-arg base_image=${baseImage}"

            if ("true".equals(env.NO_CACHE)) {
                args = "${args} --no-cache"
            }

            def localMirror = env.LOCAL_MIRROR
            if (localMirror == null) {
                docker.build(env.DOCKER_IMAGE, "${args} .")
            } else {
                def version = sh(returnStdout: true, script: "basename ${localMirror}").trim()

                dir("local_mirrors") {
                    sh("rm -rf ${version}")
                    sh("ln -s ${localMirror}")
                }

                sh("bash scripts/sync_local_mirror.sh ${version}")

                docker.image('nginx:alpine').withRun("-v ${localMirror}:/usr/share/nginx/html/${version}:ro -p 80") { c ->
                    def localPort = sh(script: "#!/bin/bash -e\ndocker port ${c.id} 80 | cut -d: -f2", returnStdout: true).trim()

                    args = "${args} --build-arg mirror=http://localhost:${localPort}/${version}/ --network=host"

                    docker.build(env.DOCKER_IMAGE, "${args} .")
                }
            }

            deleteDir()
        }
    }
}
