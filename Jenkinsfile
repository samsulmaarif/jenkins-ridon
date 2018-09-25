pipeline {
    agent {
        node {
            label 'ridon-7.1.2'
            //customWorkspace '/home/ridon/workspace/'
        }
    }

    stages {
        stage('build') {
            agent {
                docker {
                    image 'samsulmaarif/ridon-builder'
                    args '-v /tmp/ridon:/ridon/ '
                }
            }
            environment {
                USE_CCACHE = '1'
                ANDROID_JACK_VM_ARGS = '-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G'
            }
            steps {
                sh 'cd /ridon/'
                sh 'repo init -u https://github.com/ridon/ridon.git --depth 1 -b ridon-7.1.2'
                sh 'echo "repo sync"'
                sh 'mkdir -p .repo/local_manifests'
                sh 'wget -O .repo/local_manifests/roomservice.xml https://raw.githubusercontent.com/ridon/local_manifests/ridon-7.1.2/device_bacon.xml'
                sh 'echo "repo sync"'
                sh 'source build/envsetup.sh'
                sh 'breakfast bacon'
                sh 'prebuilts/misc/linux-x86/ccache/ccache -M 50G'
                sh 'croot'
                sh 'echo "brunch bacon"'
            }
        }
        
    }
}
