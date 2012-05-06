(setq user-mail-address "lijiele__dev@163.com")
(setq user-full-name "Li Ji")

(setq gnus-select-method '(nntp "news.gmane.org"))

(setq gnus-secondary-select-methods '((nnml ""))
       mail-sources '((pop :server "pop.163.com"
                           :user "lijiele__dev@163.com")))

;(add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
;                                  (nnimap-address "imap.gmail.com")
;                                  (nnimap-server-port 993)
;                                  (nnimap-stream ssl)))
;
;(setq gnus-select-method '(nnimap "gmail"
;				  (nnimap-address "imap.gmail.com")
;				  (nnimap-server-port 993)
;				  (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-auth-credentials '(("smtp.163.com" 25 "lijiele__dev@163.com"))
      smtpmail-default-smtp-server "smtp.163.com"
      smtpmail-smtp-server "smtp.163.com")

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; (setq gnus-secondary-select-methods '((nnml ""))
;;       mail-sources '((imap :server "machine"
;;                           :user "lijiele@gmail.com")))

;;dont delete mail from server
(setq pop3-leave-mail-on-server t)








