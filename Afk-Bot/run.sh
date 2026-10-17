
#!/command/with-contenv bashio

cd /app || exit 1

bashio::log.info "Minecraft AFK Bot wird gestartet."

while true; do
    bashio::log.info "Starte Bot-Prozess ..."

    node index.js
    status=$?

    bashio::log.warning \
      "Bot-Prozess beendet (Status $status). Neuer Versuch in 10 Sekunden."

    sleep 10
done
