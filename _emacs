(setq standard-indent 2)
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist (quote ((".*" . "~/tmp/.emacs_backups/"))))
(setq auto-fill-mode 1)

(add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/elisp/emacs-jabber-0.8.90")
(load "jabber-autoloads")
(setq jabber-account-list
  '(("lijiele@gmail.com"
     (:password . "abcdli1983")
     (:network-server . "talk.google.com")
     (:connection-type . ssl))))
(setq jabber-roster-line-format "%c%n - %s")
(setq jabber-chat-buffer-show-avatar nil)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.t$" . php-mode))


                                        ;(load "php-mode")
                                        ;(add-to-list 'auto-mode-alist
                                        ;           '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(global-set-key [f11] 'toggle-fullscreen)

                                        ; Make new frames fullscreen by default. Note: this hook doesn't do
                                        ; anything to the initial frame if it's in your .emacs, since that file is
                                        ; read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)

(require 'fullscreen)
(require 'color-theme)
(color-theme-initialize)
(if window-system
    ;;    (color-theme-hober))
    (color-theme-charcoal-black))
                                        ;(your-config-name)
(set-face-attribute 'default nil :height 100)
(menu-bar-mode 0)
(tool-bar-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(scroll-bar-mode nil)
 '(tooltip-mode nil))
 '(menu-bar-mode nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;compile display color remove ^[[0m
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;;diable mouse set point
(setq mouse-set-point 0)

(add-to-list 'load-path "~/elisp/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/elisp//ac-dict")
(ac-config-default)

;; (add-hook 'php-mode-hook
;;           (lambda ()
;;             (require 'php-completion)
;;             (php-completion-mode t)
;;             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)))

;;(require 'blank-mode)
;;(global-set-key "\C-c_b" 'blank-mode)


(require 'w3m-load)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;;(global-set-key "\C-xm" 'browse-url-at-point)

(setq w3m-use-cookies t)
(setq w3m-default-display-inline-images t)
(setq w3m-command-arguments '("-cookie" "-F"))

;; load ibus-mode
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
;; Use C-SPC for Set Mark command
(ibus-define-common-key ?\C-\s nil)
;; Use C-/ for Undo command
(ibus-define-common-key ?\C-/ nil)
;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("red" "blue" "limegreen"))
;; use C-; to toggle IBus
(global-set-key [(control ?;)] 'ibus-toggle)
;; Enable C-; key only for preediting
(ibus-define-common-key [(control ?;)] nil)
(ibus-define-preedit-key [(control ?;)] t)


;;copy
(setq x-select-enable-clipboard t)

;; disable the mouse-1
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1]))
  (global-unset-key k))


;;disable the welcome page
(setq inhibit-splash-screen t)

(add-to-list 'load-path "~/elisp/magit-1.0.0")
(require 'magit)
(global-set-key "\C-xg" 'magit-status)

;;config for paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

;;create tags
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.*\" | xargs etags --append" dir-name)))

;;
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;ido mode
(ido-mode t)


;; below configration is taste about:
;; https://github.com/rmm5t/dotfiles
;;
;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


(require 'multi-term)
(setq multi-term-program "/bin/bash")

(require 'org-latex)
(setq org-export-latex-listings t)
(add-to-list 'org-export-latex-classes
             '("org-article"
               "\\documentclass{org-article}
                 [NO-DEFAULT-PACKAGES]
                 [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-latex-to-pdf-process '("xelatex %f"))
;;autopair
(require 'autopair)
(autopair-global-mode)

(require 'plantuml-mode)

;;tabbar
(require 'tabbar)
(tabbar-mode)
(global-set-key (quote [s-left]) (quote tabbar-backward))
(global-set-key (quote [s-right]) (quote tabbar-forward))
(global-set-key (quote [s-up]) (quote tabbar-backward-group))
(global-set-key (quote [s-down]) (quote tabbar-forward-group))

(setq tabbar-buffer-groups-function 'tabbar-buffer-ignore-groups)

(defun tabbar-buffer-ignore-groups (buffer)
  "Return the list of group names BUFFER belongs to.
Return only one group for each buffer."
  (with-current-buffer (get-buffer buffer)
    (cond
     ((or (get-buffer-process (current-buffer))
          (memq major-mode
                '(comint-mode compilation-mode)))
      '("Process")
      )
     ((member (buffer-name)
              '("*scratch*" "*Messages*"))
      '("Common")
      )
     ((eq major-mode 'dired-mode)
      '("Dired")
      )
     ((memq major-mode
            '(help-mode apropos-mode Info-mode Man-mode))
      '("Help")
      )
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      '("Mail")
      )
     (t
      (list
       "default"  ;; no-grouping
       (if (and (stringp mode-name) (string-match "[^ ]" mode-name))
           mode-name
         (symbol-name major-mode)))
      )

     )))

;;hippie-expand
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))
;;patterness % like vi
;;(global-set-key "%" 'match-paren)
;;(defun match-paren (arg)
;;  "Go to the matching paren if on a paren; otherwise insert %."
;;  (interactive "p")
;;  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;	(t (self-insert-command (or arg 1)))))

;;like the bookmark
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;;go-to-char
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-c a") 'wy-go-to-char)

(setq column-number-mode t)
(setq default-fill-column 70)
;;;;tab config
;;(setq-default indent-tabs-mode nil)
;;(setq default-tab-width 4)
;;(setq tab-stop-list ())
;;(loop for x downfrom 40 to 1 do
;;      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

(setq frame-title-format "emacs@%b")

;; Key binding to invoke the dictionary client
(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)

;; The dictionary server is running on the local machine
(setq dictionary-server "localhost")
(global-dictionary-tooltip-mode 1)

;; irfc
(require 'irfc)
(setq irfc-directory "~/workstation/rfc/")
(setq irfc-assoc-mode t)


;;uniq
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)