;; -*-Emacs-Lisp-*-
;; This file is designed to be re-evaled; use the variable first-time
;; to avoid any problems with this.
(defvar first-time t
  "Flag signifying this is the first time that .emacs has been evaled")

;; Supress the GNU startup message
(setq inhibit-startup-message t)

(add-to-list 'default-frame-alist
	     '(font . "Monaco-10"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; emacs exec path
(add-to-list 'exec-path "~/")
(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'exec-path "/usr/texbin")
(add-to-list 'exec-path "~/.emacs.d/elisp/haskell")
;;(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))

;(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/personal")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/elisp/haskell")
(add-to-list 'load-path "~/")
(add-to-list 'load-path "~/.emacs.d/elpa/org-mode")
(add-to-list 'load-path "~/.emacs.d/elpa/org-mode/lisp")

(add-to-list 'load-path "/Users/pareshmg/.emacs.d/themes/solarized-theme-20130619.2056")
(add-to-list 'custom-theme-load-path "/Users/pareshmg/.emacs.d/themes/solarized-theme-20130619.2056")


(require '.me)

;; Require Common Lisp. (cl in <=24.2, cl-lib in >=24.3.)
(if (require 'cl-lib nil t)

  (progn
    (defalias 'cl-block-wrapper 'identity)
    (defalias 'member* 'cl-member)
    (defalias 'adjoin 'cl-adjoin))
  ;; Else we're on an older version so require cl.
  (require 'cl))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; CEDET
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (load-file "~/.emacs.d/elpa/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu


(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Prelude
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/init.el")

(setq prelude-guru nil)


;; hide the scroll bar
(scroll-bar-mode -1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; windows mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (display-graphic-p)
    (progn
      (desktop-save-mode 1)
      (require 'windows)
      (win:startup-with-window)
      (define-key ctl-x-map "C" 'see-you-again))
  (progn
    (desktop-save-mode 0)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Command is meta in OS X.
(setq ns-command-modifier 'meta)
(setq ns-option-modifier 'hyper) ; sets the Option key as Hyper
(setq ns-function-modifier 'super) ; sets the Option key as Super

(setq mac-command-modifier 'meta) ; sets the Command key as Meta
(setq mac-option-modifier 'hyper) ; sets the Option key as Hyper




(global-unset-key (kbd "<magnify-up>"))
(global-unset-key (kbd "<magnify-down>"))


;; ;; move by newline - not visual line
;; (setq line-move-visual nil) ; use “t” for true, “nil” for false
;; (setq debug-on-error t)


;; (defun toggle-line-move-visual ()
;;   "Toggle behavior of up/down arrow key, by visual line vs logical line."
;;   (interactive)
;;   (if line-move-visual
;;       (setq line-move-visual nil)
;;     (setq line-move-visual t))
;;   )



;; ;; line numbers in margin
;; ;;(global-linum-mode 1)


;; ;; Meta
;; (global-set-key "\M- " 'set-mark-command)
;; (global-set-key "\M-\C-h" 'backward-kill-word)
;; ;;(global-set-key "\M-\C-r" 'query-replace)
;; (global-set-key "\M-r" 'replace-string)
(global-set-key "\M-g" 'goto-line)
;; (global-set-key "\M-h" 'help-command)
;; (global-set-key "\C-c\C-c" 'comment-region)
(global-set-key (kbd "H-<backspace>") 'backward-kill-word)



;; ;; Function keys
;; (global-set-key [f1] 'manual-entry)
;; (global-set-key [f2] 'info)
;; (global-set-key [f3] 'repeat-complex-command)
;; (global-set-key [f4] 'advertised-undo)
;; (global-set-key [f5] 'eval-current-buffer)
;; (global-set-key [f6] 'buffer-menu)
;; (global-set-key [f7] 'other-window)
;; ;(global-set-key [f8] 'find-file)
;; (global-set-key [f9] 'save-buffer)
;; (global-set-key [f10] 'next-error)
;; (global-set-key [f11] 'compile)
;; (global-set-key [f12] 'grep)
;; (global-set-key [C-f1] 'compile)
;; (global-set-key [C-f2] 'grep)
;; (global-set-key [C-f3] 'next-error)
;; (global-set-key [C-f4] 'previous-error)
;; (global-set-key [C-f5] 'display-faces)
;; (global-set-key [C-f8] 'dired)
;; (global-set-key [C-f10] 'kill-compilation)
;; (global-set-key [C-M-tab] 'indent-all)

;; ;; Keypad bindings
;; (global-set-key [up] "\C-p")
;; (global-set-key [down] "\C-n")
;; (global-set-key [left] "\C-b")
;; (global-set-key [right] "\C-f")
;; (global-set-key [home] "\C-a")
;; (global-set-key [end] "\C-e")
;; (global-set-key [prior] "\M-v")
;; (global-set-key [next] "\C-v")
;; (global-set-key [C-up] "\M-\C-b")
;; (global-set-key [C-down] "\M-\C-f")
;; (global-set-key [C-left] "\M-b")
;; (global-set-key [C-right] "\M-f")
;; (global-set-key [C-home] "\M-<")
;; (global-set-key [C-end] "\M->")
;; (global-set-key [C-prior] "\M-<")
;; (global-set-key [C-next] "\M->")




;; ;; Mouse
;; (global-set-key [mouse-3] 'imenu)

;; ;; Misc
;; (global-set-key [C-tab] "\C-q\t")   ; Control tab quotes a tab.
;; (setq backup-by-copying-when-mismatch t)

;; ;; Treat 'y' or <CR> as yes, 'n' as no.
;; (fset 'yes-or-no-p 'y-or-n-p)
;; (define-key query-replace-map [return] 'act)
;; (define-key query-replace-map [?\C-m] 'act)

;; remove C-z to minimize cause it is annoying
(global-set-key "\C-Z" nil)
(global-set-key (kbd "C-M-z") 'suspend-frame)




;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 2)




;; ;; Load packages
;; ;;(require 'desktop)
;; (autoload 'tar-mode "tar-mode" "Tar Mode" t)

;; (require 'smart-operator)

;; (setq ns-use-system-highlight-color nil)
;; ;; color theme
;; (require 'color-theme)
;; ;;(require 'zenburn)
;; (require 'color-theme-tangotango)

;; (color-theme-initialize)
;; ;;(if (< (display-color-cells) 20)
;; ;(color-theme-tty-dark)
;; ;;(color-theme-charcoal-black)
;; ;;(color-theme-zenburn)
;; (color-theme-tangotango)

;; ;; Pretty diff mode
;; (autoload 'ediff-buffers "ediff" "Intelligent Emacs interface to diff" t)
;; (autoload 'ediff-files "ediff" "Intelligent Emacs interface to diff" t)
;; (autoload 'ediff-files-remote "ediff"
;;   "Intelligent Emacs interface to diff")



;; ;; Indentation
;; (setq-default indent-tabs-mode nil)
;; (setq-default standard-indent 2)
;; (setq-default c-basic-offset 2)
;; (setq-default c-indent-level 2)

;; ;; Global tab setting
;; (setq-default tab-width 2)

;; ;; Set tab stops (2 spaces per tab)
;; (setq tab-stop-list (let ((tabsize 2)
;;                     (lst '()))
;;                   (dotimes (i 80)
;;                    (push (+ tabsize (* i tabsize)) lst))
;;                   (reverse lst)))

;; ;; Misc...
;; (global-auto-revert-mode t)
;; (transient-mark-mode 1)
;; (setq mark-even-if-inactive t)

;; (setq next-line-add-newlines nil)
;; (setq compile-command "make")
;; (setq suggest-key-bindings nil)
;; (put 'eval-expression 'disabled nil)
;; (put 'narrow-to-region 'disabled nil)
;; (put 'set-goal-column 'disabled nil)
;; (if (>= emacs-major-version 21)
;;     (setq show-trailing-whitespace t))

;; ;; Elisp archive searching
;; (autoload 'format-lisp-code-directory "lispdir" nil t)
;; (autoload 'lisp-dir-apropos "lispdir" nil t)
;; (autoload 'lisp-dir-retrieve "lispdir" nil t)
;; (autoload 'lisp-dir-verify "lispdir" nil t)

;; ;; Font lock mode
;; (defun my-make-face (face color &optional bold)
;;   "Create a face from a color and optionally make it bold"
;;   (make-face face)
;;   (copy-face 'default face)
;;   (set-face-foreground face color)
;;   (if bold (make-face-bold face))
;;   )

;; ;; (if (eq window-system 'x)
;; ;;     (progn
;; ;;       (my-make-face 'blue "blue")
;; ;;       (my-make-face 'red "red")
;; ;;       (my-make-face 'green "dark green")
;; ;;       (setq font-lock-comment-face 'blue)
;; ;;       (setq font-lock-string-face 'bold)
;; ;;       (setq font-lock-type-face 'bold)
;; ;;       (setq font-lock-keyword-face 'bold)
;; ;;       (setq font-lock-function-name-face 'red)
;; ;;       (setq font-lock-doc-string-face 'green)
;; ;;       (add-hook 'find-file-hooks 'font-lock-auto-mode-select)

;; ;;       (setq baud-rate 1000000)
;; ;;       (global-set-key "\C-cmm" 'menu-bar-mode)
;; ;;       (global-set-key "\C-cms" 'scroll-bar-mode)
;; ;;       (global-set-key [backspace] 'backward-delete-char)
;; ;;       (global-set-key [delete] 'delete-char)
;; ;;       (load-library "iso-transl")))

;; ;; X11 or PC using direct screen writes
;; ;; (if window-system
;; ;;     (progn
;; ;;       ;;      (global-set-key [M-f1] 'hilit-repaint-command)
;; ;;       ;;      (global-set-key [M-f2] [?\C-u M-f1])
;; ;;       (setq hilit-mode-enable-list
;; ;;         '(not text-mode c-mode c++-mode emacs-lisp-mode lisp-mode
;; ;;           scheme-mode)
;; ;;         hilit-auto-highlight nil
;; ;;         hilit-auto-rehighlight 'visible
;; ;;         hilit-inhibit-hooks nil
;; ;;         hilit-inhibit-rebinding t)
;; ;;       (require 'hilit19)
;; ;;       (require 'paren))
;; ;;   (setq baud-rate 2400)         ; For slow serial connections
;; ;;   )

;; ;; TTY type terminal
;; (if (and (not window-system)
;;      (not (equal system-type 'ms-dos)))
;;     (progn
;;       (if first-time
;;       (progn
;;         (keyboard-translate ?\C-h ?\C-?)
;;         (keyboard-translate ?\C-? ?\C-h)))))

;; ;; ;; Under UNIX
;; ;; (if (not (equal system-type 'ms-dos))
;; ;;     (progn
;; ;;       (if first-time
;; ;;           (server-start))))

;; (add-hook 'server-switch-hook
;;           (lambda nil
;;             (let ((server-buf (current-buffer)))
;;               (bury-buffer)
;;               (switch-to-buffer-other-window server-buf))))
;; ;; (add-hook 'server-done-hook (lambda nil (kill-buffer nil)))


;; ;; Add any face changes here
;; (add-hook 'term-setup-hook 'my-term-setup-hook)
;; (defun my-term-setup-hook ()
;;   (if (eq window-system 'pc)
;;       (progn
;; ;;  (set-face-background 'default "red")
;;     )))

;; ;; Restore the "desktop" - do this as late as possible
;; ;;(if first-time
;; ;;    (progn
;; ;;      (desktop-load-default)
;; ;;      (desktop-read)))

;; ;; Indicate that this file has been read at least once
;; (setq first-time nil)

;; ;; No need to debug anything now

;; (setq debug-on-error nil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;  other possible additions  ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; Show buffer in window title
;; (setq frame-title-format "%b - Emacs")


;; ;; Turn off the menu bar
;; ;;(menu-bar-mode -1)



;; ;; Make the buffer re-highlight when we recenter
;; (global-set-key "\C-\\" 'hilit-highlight-buffer)
;; (global-set-key "\C-l" 'recenter)

;; ;; Get backspace key to work properly on many machines.
;; (setq term-setup-hook
;;       '(lambda()
;;          (setq keyboard-translate-table "\C-@\C-a\C-b\C-c\C-d\C-e\C-f\C-g")
;;          (global-set-key "\M-h" 'help-for-help)))


;; (setq bell-volume nil)
;; (setq visible-bell nil)
;; (setq sound-alist nil)
;; (setq ring-bell-function 'ignore)
;; ;;(setq visible-bell 'top-bottom)

(setq ring-bell-function 'ignore)

;; ;; Show buffer in window title
;; ;(setq frame-title-format "%b - Emacs")

;; ;; Turn off CVS for Emacs.  This fixes mysterious problems where Emacs
;; ;; makes CVS controlled files read-only sometimes.
;; (setq vc-handle-cvs nil)


;; ;; enable mouse wheel
;; (mouse-wheel-mode t)


;; ;; make things more consistent, yes and y
;; ;(fset 'yes-or-no-p 'y-or-n-p)

;; ;; ========== Line by line scrolling ==========
;; ;; This makes the buffer scroll by only a single line when the up or
;; ;; down cursor keys push the cursor (tool-bar-mode) outside the
;; ;; buffer. The standard emacs behaviour is to reposition the cursor in
;; ;; the center of the screen, but this can make the scrolling confusing

;; ;; (setq scroll-step 1)

;; ;; ===== Function to delete a line =====
;;  ;; First define a variable which will store the previous column position
;;  (defvar previous-column nil "Save the column position")
;;  ;; Define the nuke-line function. The line is killed, then the newline
;;  ;; character is deleted. The column which the cursor was positioned at is then
;;  ;; restored. Because the kill-line function is used, the contents deleted can
;;  ;; be later restored by usibackward-delete-char-untabifyng the yank commands.
;;  (defun nuke-line()
;;    "Kill an entire line, including the trailing newline character"
;;    (interactive)
;;    ;; Store the current column position, so it can later be restored for a more
;;    ;; natural feel to the deletion
;;    (setq previous-column (current-column))
;;    ;; Now move to the end of the current line

;;    (end-of-line)

;;    ;; Test the length of the line. If it is 0, there is no need for a
;;    ;; kill-line. All that happens in this case is that the new-line character
;;    ;; is deleted.
;;    (if (= (current-column) 0)
;;      (delete-char 1)
;;      ;; This is the 'else' clause. The current line being deleted is not zero
;;      ;; in length. First remove the line by moving to its start and then
;;      ;; killing, followed by deletion of the newline character, and then
;;      ;; finally restoration of the column position.
;;      (progn
;;        (beginning-of-line)
;;        (kill-line)
;;        (delete-char 1)
;;        (move-to-column previous-column))))
;; ;; Now bind the delete line function to the F8 key
;; (global-set-key [f8] 'nuke-line)


;; ;; ========== Place Backup Files in Specific Directory ==========
;;  ;; Enable backup files.
;;  (setq make-backup-files t)
;; ;; Enable versioning with default values (keep five last versions, I think!)
;;  (setq version-control t)
;; ;; Save all backup file in this directory.
;; (if (eq system-type "darwin")
;;     (setq backup-directory-alist (quote ((".*" . "/Volumes/Ramdisk/.emacs_backups/"))))
;;   (setq backup-directory-alist (quote ((".*" . "/tmp/.emacs_backups/")))))

;; ;;(setq tramp-backup-directory-alist backup-directory-alist)
;; ;;(add-to-list 'backup-directory-alist
;; ;;             (cons tramp-file-name-regexp nil))

;; ;;;;;Highlight line mode
;; ;(global-hl-line-mode 1)
;; ;; To customize the background color
;; ;(set-face-background 'hl-line "#333")  ;; Emacs 22 Only


;; (autoload 'epa-setup "epa-setup")
;; ;;(epa-file-enable)
;; (setq epg-gpg-program "/usr/local/bin/gpg")
;; (setenv "GPG_AGENT_INFO" nil)
;; ;;(setq epa-file-cache-passphrase-for-symmetric-encryption f)





;; ;;(add-to-list 'load-path "/Users/pareshmg/.emacs.d/elisp/")
;; (require 'auto-complete-config)
;; ;(add-to-list 'ac-dictionary-directories "/Users/pareshmg/.emacs.d/elisp/ac-dict")
;; (ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Yasnippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
;; (require 'yasnippet)
;; (yas-global-mode 1)
(setq yas-trigger-key "\C-\M-y")
;; ;;(setq yas-expand "\C-\M-y")
;; (yas/load-directory "~/.emacs.d/snippets")
;; (setq yas-snippet-dirs '("~/.emacs.d/elisp/yasnippet"))


;; (require 'auto-complete-yasnippet)


;; ;;(set-face-attribute 'region nil :background "purple")

;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (add-hook 'compilation-shell-minor-mode-hook 'ansi-color-for-comint-mode-on)

;; (load "myFuns.el")
;; (load "myModes.el")
;; ;;(load "org-config.el")
;; ;;(load "lisp.el")




;; ;; Conkeror stuff
;; ;; (setq browse-url-browser-function 'browse-url-generic)
;; ;; (setq browse-url-generic-program  "/Applications/conkeror.mozdev.org/conkeror.app/Contents/MacOS/xulrunner")




;; (defvar hcz-set-cursor-type-type t)
;; (defvar hcz-set-cursor-type-buffer t)
;; (defun hcz-set-cursor-type-according-to-mode ()
;;   "change cursor type according to some minor modes."
;;   ;; set-cursor-color is somewhat costly, so we only call it when needed:
;;   ;; setq cursor-type is somewhat costly, so we only call it when needed:
;;   (let ((type
;;          (if buffer-read-only 'hbar
;;            (if overwrite-mode 'hollow
;;              'bar)))
;;         (color
;;          (if buffer-read-only "red"
;;            (if overwrite-mode "purple"
;;              "yellow"))))
;;     (unless (and
;;              (string= type hcz-set-cursor-type-type)
;;              (string= (buffer-name) hcz-set-cursor-type-buffer))
;;       (set-cursor-color (setq hcz-set-cursor-color-color color))
;;       (setq cursor-type (setq hcz-set-cursor-type-type type))
;;       (setq hcz-set-cursor-type-buffer (buffer-name)))
;;     )
;;   )
;; (add-hook 'post-command-hook 'hcz-set-cursor-type-according-to-mode)

;; ;; ;; Change cursor color according to mode; inspired by
;; ;; ;; http://www.emacswiki.org/emacs/ChangingCursorDynamically
;; ;; (setq djcb-read-only-color       "gray")
;; ;; ;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; ;; ;; (hbar. HEIGHT); see the docs for set-cursor-type

;; ;; (setq djcb-read-only-cursor-type 'hbar)
;; ;; (setq djcb-overwrite-color       "red")
;; ;; (setq djcb-overwrite-cursor-type 'box)
;; ;; (setq djcb-normal-color          "gray")
;; ;; (setq djcb-normal-cursor-type    'box)

;; ;; (defun djcb-set-cursor-according-to-mode ()
;; ;;   "change cursor color and type according to some minor modes."

;; ;;   (cond
;; ;;     (buffer-read-only
;; ;;       (set-cursor-color djcb-read-only-color)
;; ;;       (setq cursor-type djcb-read-only-cursor-type))
;; ;;     (overwrite-mode
;; ;;       (set-cursor-color djcb-overwrite-color)
;; ;;       (setq cursor-type djcb-overwrite-cursor-type))
;; ;;     (t
;; ;;       (set-cursor-color djcb-normal-color)
;; ;;       (setq cursor-type djcb-normal-cursor-type))))

;; ;; (add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)


;; (define-minor-mode sensitive-mode
;;   "For sensitive files like password lists.
;; It disables backup creation and auto saving.

;; With no argument, this command toggles the mode.
;; Non-null prefix argument turns on the mode.
;; Null prefix argument turns off the mode."
;;   ;; The initial value.
;;   nil
;;   ;; The indicator for the mode line.
;;   " Sensitive"
;;   ;; The minor mode bindings.
;;   nil
;;   (if (symbol-value sensitive-mode)
;;       (progn
;;  ;; disable backups
;;  (set (make-local-variable 'backup-inhibited) t)
;;  ;; disable auto-save
;;  (if auto-save-default
;;      (auto-save-mode -1)))
;;     ;resort to default value of backup-inhibited
;;     (kill-local-variable 'backup-inhibited)
;;     ;resort to default auto save setting
;;     (if auto-save-default
;;  (auto-save-mode 1))))




;; (setq auto-mode-alist
;;  (append '(("\\.gpg$" . sensitive-mode))
;;                auto-mode-alist))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Spelling configuration
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq ispell-program-name "/usr/local/bin/aspell")
;; (setq ispell-list-command "list")

;; ;; The problem with using aspell with flyspell is that in its
;; ;; default mode, it it a lot slower than ispell. Fortunately, you
;; ;; can tell it to speed up, though this reduces somewhat the quality
;; ;; of its suggestions. So try this:

;; (setq ispell-program-name "aspell")
;; (setq ispell-extra-args '("--sug-mode=ultra"))

;; ;; I highly suggest setting ‘flyspell-issue-message-flag’ to nil,
;; ;; as printing messages for every word (when checking the entire
;; ;; buffer) causes an enormous slowdown. – nschum

;; (setq flyspell-issue-message-flag nil)
;; (global-set-key "\M-\C-f" 'flyspell-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; column width
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq fill-column 80)
(setq-default fill-column 85)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Other
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(flymake-errline ((((class color)) (:underline "red"))))
;;  '(flymake-warnline ((((class color)) (:underline "yellow"))))
;;  '(flyspell-duplicate ((t (:foreground "Gold3" :underline t))))
;;  '(flyspell-incorrect ((t (:foreground "OrangeRed" :underline t))))
;;  '(flyspell-incorrect-face ((t (:foreground "OrangeRed" :underline t))) t))


;; ;; (defun load-py3 ()
;; ;;   "Load pymacs and ropemacs"
;; ;;   (preload-pyCommon)
;; ;;   (setenv "PYMACS_PYTHON" "python")
;; ;;   (setenv "PYTHON" "python")
;; ;;   (setq python-python-command "/usr/local/bin/ipython")
;; ;;   (postload-pyCommon)
;; ;; )


;; ;; (defun load-py2 ()
;; ;;   "Load pymacs and ropemacs"
;; ;;   (preload-pyCommon)
;; ;;   (setenv "PYMACS_PYTHON" "python")
;; ;;   (setenv "PYTHON" "python")
;; ;;   (setq python-python-command "/usr/bin/ipython")
;; ;;   (postload-pyCommon)
;; ;;   )


;; ;; (defun postload-pyCommon ()
;; ;;   (add-hook 'python-mode-hook '(lambda () (subword-mode 1)))
;; ;;   (add-hook 'python-mode-hook '(lambda () (load-library "init_python")))
;; ;;   (autoload 'python-mode "python-mode" "Python Mode." t)
;; ;;   (defadvice py-execute-buffer (around python-keep-focus activate)
;; ;;     "return focus to python code buffer"
;; ;;     (save-excursion ad-do-it))
;; ;;   (setq ipython-completion-command-string "print(';'.join(__IP.Completer.all_completions('%s')))\n")
;; ;;   (require 'ipython)
;; ;;   (setq py-python-command-args '( "-colors" "Linux"))
;; ;;   (require 'pymacs)
;; ;;   (pymacs-load "ropemacs" "rope-")
;; ;;   (provide 'python-programming)

;; ;; )

;; ;; (defun preload-pyCommon ()
;; ;;   (setq load-path
;; ;;         (append (list nil
;; ;;                       "~/.emacs.d/python-mode-1.0/"
;; ;;                       "~/.emacs.d/pymacs/"
;; ;;                       "~/.emacs.d/ropemacs"
;; ;;                       )
;; ;;                 load-path))
;; ;; )




;; ;; (defvar py-eq-face 'py-eq-face
;; ;;   "Face for builtins like TypeError, object, open, and exec.")
;; ;; (make-face 'py-eq-face)

;; ;; (set-face-foreground 'py-eq-face "red")

;; ;; (defun py-font-lock-mode-hook ()
;; ;;   (or (face-differs-from-default-p 'py-eq-face)
;; ;;       (copy-face 'org-date 'py-eq-face))

;; ;;   )
;; ;; (add-hook 'font-lock-mode-hook 'py-font-lock-mode-hook)


;; ;; (defvar my-python-font-lock-keywords
;; ;;     (list
;; ;;      ;; eq sign
;; ;;      ;; pseudo-keywords
;; ;;      '("\\b\\(self\\|None\\|True\\|False\\|Ellipsis\\)\\b"
;; ;;        1 py-eq-face)
;; ;;      '("a"
;; ;;        1 py-eq-face)
;; ;;      )
;; ;;   "Additional expressions to highlight in Python mode.")


;; ;; (put 'python-mode 'font-lock-defaults '(my-python-font-lock-keywords))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;autocomplete stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'auto-complete nil t)
  (require 'auto-complete-config)
  (ac-config-default)

  ;;(require 'auto-complete-yasnippet)
  ;;(require 'auto-complete-python)
  ;;(require 'auto-complete-css)
  ;;(require 'auto-complete-cpp)
  ;;(require 'auto-complete-emacs-lisp)
  ;;(require 'auto-complete-semantic)
  ;;(require 'auto-complete-gtags)
  (setq ac-delay 0.1) ;; eclipse uses 500ms
  (global-auto-complete-mode t)
  (setq ac-auto-start 1)
  (setq ac-dwim t)
  (set-default 'ac-sources
               '(
                 ac-source-filename
                 ;;ac-source-yasnippet
                 ac-source-gtags
                 ac-source-abbrev
                 ac-source-words-in-same-mode-buffers
                 ;ac-source-files-in-current-dir
                 ;ac-source-symbols)
               ))

  ;; Ignore case if completion target string doesn't include upper characters
  ;;other options: 'smart or t
  (setq ac-ignore-case nil)
  (setq ac-use-menu-map t)
  ;; Default settings
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)
  (global-set-key (kbd "H-/") 'auto-complete)
  (define-key ac-completing-map (kbd "H-/") 'ac-complete)
  ;; 20 lines
  (setq ac-menu-height 4)
  ;; Examples
  ;;(set-face-background 'ac-candidate-face "gray28")
  (set-face-background 'ac-candidate-face "black")
  (set-face-foreground 'ac-candidate-face "DeepSkyBlue")
  (set-face-background 'ac-selection-face "gray15")
  (set-face-foreground 'ac-selection-face "SeaGreen2")
  )


(package-initialize)
(smartparens-global-mode t)

;; ;(require 'auto-pair+)
;; (setq autopair-autowrap t)




;; ;; region coloring
;; (require 'highlight)
;; (require 'facemenu+)
;; (require 'font-lock+)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Aspell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq ispell-program-name "aspell"
      ispell-dictionary "english"
      ispell-dictionary-alist
      (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
                       ("-B" "-d" "english" "--dict-dir"
                        "/Library/Application Support/cocoAspell/aspell6-en-6.0-0")
                       nil iso-8859-1)))
        `((nil ,@default)
          ("english" ,@default))))



;(setq ispell-extra-args '("--sug-mode=normal"))
(setq ispell-list-command "list")



;; ;; align according to regexp
(global-set-key (kbd "C-x a r") 'align-regexp)
(global-set-key (kbd "C-x O") 'previous-multiframe-window)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Tramp
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq tramp-default-method "ssh")
;; (setq tramp-chunksize 500)
;; (setq tramp-auto-save-directory "/tmp/.emacs_backups/tramp-autosave")


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Whizzy tex : automatic tex preview
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (autoload 'whizzytex-mode
;;   "~/.emacs.d/elisp/whizzytex/whizzytex"
;;   "WhizzyTeX, a minor-mode WYSIWIG environment for LaTeX" t)
;; (setq-default whizzy-viewers '(("-pdf" "emacs")) ) ;;(("-dvi" "xdvi")("-ps" "emacs")("-pdf" "emacs" ) ))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; ECB
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/elpa/ecb")
;; (setq stack-trace-on-error t)
;; (require 'ecb-autoloads)

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))



(require 'evil-numbers)
(global-set-key (kbd "C-c n +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c n -") 'evil-numbers/dec-at-pt)

;; start the emacs server so emacsclient can attach to it
;(server-start)


(message "All done, %s%s" (user-login-name) ".")

;; ido mode extra config
(setq ido-file-extensions-order '(".hs" ".py" ".lhs" ".org" ".tex" ".txt" ".xml" ".el" ))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1) 

;; (autoload 'tar-mode "tar-mode" "Tar Mode" t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Jira
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq jiralib-url "https://cmtelematics.atlassian.net") 
;; you need make sure whether the "/jira" at the end is 
;; necessary or not, see discussion at the end of this page

(require 'org-jira) 
;; jiralib is not explicitly required, since org-jira will load it.

(show-paren-mode t)
;;; .emacs ends here



