#!/bin/bash
if ! grep -q "eula=true" eula.txt; then
    echo "Do you agree to the Mojang EULA available at https://account.mojang.com/documents/minecraft_eula ?"
    read -N 1 -p "[y/n] " EULA
    if [ "$EULA" = "y" ]; then
        echo "eula=true" > eula.txt
        echo
    fi
fi

java -jar \
  -javaagent:log4jfix/Log4jPatcher-1.0.0.jar \
  -XX:+UseG1GC \
  -XX:+UnlockExperimentalVMOptions \
  ${EXTRA_JVM_ARGS} \
  forge-1.12.2-14.23.5.2860.jar \
  nogui
