-- By enabling this option new mailboxes that were automatically created,
-- get auto subscribed
options.subscribe = true
-- How long to wait for servers response.
options.timeout = 120

function classify_and_move_messages(results, destination)
        -- i = 0
        results_out = Set {}
        for _, mesg in ipairs(results) do
                -- print(i)
                -- i = i + 1
                mailbox, uid = table.unpack(mesg)
                message = mailbox[uid]
                text = message:fetch_message()
                classification = pipe_to("/opt/homebrew/bin/bogofilter -o0.5", text)
                -- print("classification:", classification)
                if (classification == 0) then
                        -- print("spam, baby")
                        table.insert(results_out, mesg)
                end
        end
                print(#results_out .. " spam mail(s) found") 
                results_out:move_messages(destination)
end

-- Escapes problematic characters in passwords.
-- from https://github.com/lefcha/imapfilter/issues/199
function sanitize_pwd(pwd)
    -- Chomp off newline character that is sucked in from Password Store.
    pwd = string.gsub(pwd, "\n", "")

    -- Escape backslash characters that exist in passwords. Need to escape the
    -- escape characters at each 'level' where the password string is used
    -- otherwise escape characters are lost.
    --
    -- The slashes are escaped first. If they were escaped later then
    -- characters escaped later would be escaped again.
    pwd = string.gsub(pwd, '%\\', '\\\\')

    -- Escape double quote characters that exist in passwords.
    pwd = string.gsub(pwd, '%"', '\\"')
    -- pwd = string.gsub(pwd, '%*', '\\*')

    return pwd
end

status, uol_pass = pipe_from("/opt/homebrew/bin/gpg -q -r joelewis101@doctors.org.uk -d ~/.config/neomutt/uol_pwd.txt.gpg")

uol = IMAP {
        server = "localhost",
        port = 1144,
        username = "jmlewis@liverpool.ac.uk",
        password = uol_pass
}


status, lstm_pass = pipe_from("/opt/homebrew/bin/gpg -q -r joelewis101@doctors.org.uk -d ~/.config/neomutt/lstmed_pwd.txt.gpg")

lstm = IMAP {
        server = "localhost",
        port = 1143,
        username = "joseph.lewis@lstmed.ac.uk",
        password = lstm_pass
}


status, doctors_pass = pipe_from("/opt/homebrew/bin/gpg -q -r joelewis101@doctors.org.uk -d ~/.config/neomutt/doctors_pwd.txt.gpg")
doctors_pass = sanitize_pwd(doctors_pass)
doctors = IMAP {
        server = "mail1.doctors.org.uk",
        port = 993,
        username = "joelewis101",
        password = doctors_pass,
        ssl = "auto"
}

print("Running bogofilter on UoL mailbox ...")
uol.INBOX:check_status()
results = uol.INBOX:is_unseen()
classify_and_move_messages(results, uol["junk-bogofilter"])

print("Running bogofilter on lstmed mailbox ...")
lstm.INBOX:check_status()
results = lstm.INBOX:is_unseen()
classify_and_move_messages(results, lstm["junk-bogofilter"])

print("Running bogofilter on doctors.org mailbox ...")

doctors.INBOX:check_status()
results = doctors.INBOX:is_unseen()
classify_and_move_messages(results, doctors["junk-bogofilter"])

print("Moving any messages from doctors spam to junk to keep tidy ...")

docsspam = doctors.Spam:select_all()

docsspam:move_messages(doctors.Junk)

--
print("done.")


