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
    (color-theme-billw))
                                        ;(your-config-name)
(set-face-attribute 'default nil :height 100)
(menu-bar-mode 0)
(tool-bar-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(fringe-mode 0 nil (fringe))
 '(menu-bar-mode nil)
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

(require 'blank-mode)
(global-set-key "\C-c_b" 'blank-mode)


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

