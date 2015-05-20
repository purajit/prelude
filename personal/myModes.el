;;; package -- Summary
;;; Code:
;;; Commentary:

;; (require 'compile)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Latex config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'latex-mode-hook
 '(progn
    (setq TeX-PDF-mode t)
    )
 (setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)"))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Matlab autoload
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
;; (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;; (autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)



;; (if first-time
;;     (setq auto-mode-alist
;;       (append '(("\\.cpp$" . c++-mode)
;;             ("\\.hpp$" . c++-mode)
;;             ("\\.lsp$" . lisp-mode)
;;             ("\\.scm$" . scheme-mode)
;;             ("\\.pl$" . perl-mode)
;;             ("\\.m$" . objc-mode)
;;             ) auto-mode-alist)))





;; ;; Auto font lock mode
;; (defvar font-lock-auto-mode-list
;;   (list 'c-mode 'c++-mode 'c++-c-mode 'objc-mode 'emacs-lisp-mode 'lisp-mode 'perl-mode 'scheme-mode)
;;   "List of modes to always start in font-lock-mode")

;; (defvar font-lock-mode-keyword-alist
;;   '((c++-c-mode . c-font-lock-keywords)
;;     (perl-mode . perl-font-lock-keywords))
;;   "Associations between modes and keywords")

;; (defun font-lock-auto-mode-select ()
;;   "Automatically select font-lock-mode if the current major mode is in font-lock-auto-mode-list"
;;   (if (memq major-mode font-lock-auto-mode-list)
;;       (progn
;;     (font-lock-mode t))
;;     )
;;   )

;; (global-set-key [M-f1] 'font-lock-fontify-buffer)

;; (setq c-default-style
;;       '((c-mode . "stroustrup")
;;         (c++-mode . "stroustrup")
;;         (cc-mode . "stroustrup")
;;         (other . "gnu")))


;; ;; New dabbrev stuff
;; ;(require 'new-dabbrev)
;; (setq dabbrev-always-check-other-buffers t)
;; (setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")
;; (add-hook 'emacs-lisp-mode-hook
;;       '(lambda ()
;;          (set (make-local-variable 'dabbrev-case-fold-search) nil)
;;          (set (make-local-variable 'dabbrev-case-replace) nil)))
;; (add-hook 'c-mode-hook
;;       '(lambda ()
;;          (set (make-local-variable 'dabbrev-case-fold-search) nil)
;;          (set (make-local-variable 'dabbrev-case-replace) nil)))
;; (add-hook 'text-mode-hook
;;       '(lambda ()
;;          (set (make-local-variable 'dabbrev-case-fold-search) t)
;;          (set (make-local-variable 'dabbrev-case-replace) t)))


;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)


;; ;; C++ and C mode...
;; (defun my-c++-mode-hook ()
;;   (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
;;   (define-key c++-mode-map "\C-ce" 'c-comment-edit)
;;   (setq c++-auto-hungry-initial-state 'none)
;;   ;;(setq c++-delete-function 'backward-delete-char)
;;   (setq c++-tab-always-indent t)
;;   ;;(setq c-indent-level 4)
;;   (setq c-basic-offset 2)
;;   (setq c-continued-statement-offset 2)
;;   (setq c++-empty-arglist-indent 2))

;; (defun my-c-mode-hook ()
;;   (setq tab-width 2)
;;   (setq c-basic-offset 2)
;;   (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
;;   (define-key c-mode-map "\C-ce" 'c-comment-edit)
;;   (setq c-auto-hungry-initial-state 'none)
;;   ;;(setq c-delete-function 'backward-delete-char)
;;   (setq c-tab-always-indent t)
;; ;; BSD-ish indentation style
;;   (setq c-indent-level 4)
;;   (setq c-continued-statement-offset 4)
;;   (setq c-brace-offset -4)
;;   (setq c-argdecl-indent 0)
;;   (setq c-label-offset -4))

;; (defun my-c-common-hook()
;;   (local-set-key "\M-\r" 'my-recompile))

;; (add-hook 'c-mode-common-hook 'my-c-common-hook)


;; ;; Perl mode
;; (defun my-perl-mode-hook ()
;;   (setq c-basic-offset 2)
;;   (setq tab-width 2)
;;   (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
;;   (setq perl-indent-level 4)
;;   (setq perl-continued-statement-offset 4))

;; ;; Scheme mode...
;; (defun my-scheme-mode-hook ()
;;   (define-key scheme-mode-map "\C-m" 'reindent-then-newline-and-indent))

;; ;; Emacs-Lisp mode...
;; (defun my-lisp-mode-hook ()
;;   (define-key lisp-mode-map "\C-m" 'reindent-then-newline-and-indent)
;;   (define-key lisp-mode-map "\C-i" 'lisp-indent-line)
;;   (define-key lisp-mode-map "\C-j" 'eval-print-last-sexp))

;; ;; Java mode ...
;; (defun my-java-mode-hook ()
;;   (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
;;   (define-key c++-mode-map "\C-ce" 'c-comment-edit)
;;   (setq c++-auto-hungry-initial-state 'none)
;;   ;;(setq c++-delete-function 'backward-delete-char)
;;   (setq c++-tab-always-indent t)
;;   (setq c-continued-statement-offset 2)
;;   (setq c++-empty-arglist-indent 2))


;; ;; Add all of the hooks...
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook)
;; (add-hook 'c-mode-hook 'my-c-mode-hook)
;; (add-hook 'scheme-mode-hook 'my-scheme-mode-hook)
;; (add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)
;; (add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
;; (add-hook 'perl-mode-hook 'my-perl-mode-hook)
;; (add-hook 'java-mode-hook 'my-java-mode-hook)

;; ;; Load hide-show package for folding
;; ;;(load-library "hideshow")
;; (add-hook 'c-mode-hook      '(lambda () (load-library "hideshow")))
;; (add-hook 'c++-mode-hook    '(lambda () (load-library "hideshow")))
;; (add-hook 'java-mode-hook   '(lambda () (load-library "hideshow")))


;; ;;Enable hide - block mode on startup of various modes
;; (add-hook 'c-mode-hook      '(lambda () (hs-minor-mode 1)))
;; (add-hook 'c++-mode-hook    '(lambda () (hs-minor-mode 1)))
;; (add-hook 'perl-mode-hook   '(lambda () (hs-minor-mode 1)))
;; (add-hook 'java-mode-hook   '(lambda () (hs-minor-mode 1)))
;; (add-hook 'vhdl-mode-hook   '(lambda () (hs-minor-mode 1)))
;; (add-hook 'sh-mode-hook     '(lambda () (hs-minor-mode 1)))
;; (add-hook 'matlab-mode-hook '(lambda () (hs-minor-mode 1)))


;; (add-hook 'c-mode-common-hook (lambda () (subword-mode 1)))
;; (add-hook 'c-mode-hook      '(lambda () (subword-mode 1)))
;; (add-hook 'c++-mode-hook    '(lambda () (subword-mode 1)))
;; (add-hook 'perl-mode-hook   '(lambda () (subword-mode 1)))
;; (add-hook 'java-mode-hook   '(lambda () (subword-mode 1)))
;; (add-hook 'vhdl-mode-hook   '(lambda () (subword-mode 1)))
;; (add-hook 'sh-mode-hook     '(lambda () (subword-mode 1)))
;; (add-hook 'matlab-mode-hook '(lambda () (subword-mode 1)))



(add-hook 'c-mode-common-hook (lambda () (local-unset-key (kbd "C-c C-\\"))))
(add-hook 'c-mode-hook (lambda () (local-unset-key (kbd "C-c C-\\"))))
(add-hook 'c++-mode-hook (lambda () (local-unset-key (kbd "C-c C-\\"))))



;; ;; turn on auto fill in modes
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'c-mode-hook 'turn-on-auto-fill)
;; (add-hook 'c++-mode-hook 'turn-on-auto-fill)
;; (add-hook 'java-mode-hook 'turn-on-auto-fill)
;; (add-hook 'perl-mode-hook 'turn-on-auto-fill)
;; (add-hook 'sh-mode-hook 'turn-on-auto-fill)
;; (add-hook 'matlab-mode-hook 'turn-on-auto-fill)
(add-hook 'tex-mode-hook 'turn-on-auto-fill)
(add-hook 'latex-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;; enable hungry delete : delete all white spaces on startup of modes
(add-hook 'c-mode-hook      '(lambda () (c-toggle-hungry-state 1)))
(add-hook 'c++-mode-hook    '(lambda () (c-toggle-hungry-state 1)))
(add-hook 'perl-mode-hook   '(lambda () (c-toggle-hungry-state 1)))
(add-hook 'java-mode-hook   '(lambda () (c-toggle-hungry-state 1)))
(add-hook 'vhdl-mode-hook   '(lambda () (c-toggle-hungry-state 1)))
;;(add-hook 'sh-mode-hook     '(lambda () (c-toggle-hungry-state 1)))
(add-hook 'matlab-mode-hook '(lambda () (c-toggle-hungry-state 1)))


;; use spaces only. no tabs
(customize-set-variable 'indent-tabs-mode nil)
;(setq-default 'indent-tabs-mode nil)
(add-hook 'c-mode-hook      '(lambda () (setq indent-tabs-mode nil)))
(add-hook 'c++-mode-hook    '(lambda () (setq indent-tabs-mode nil)))
(add-hook 'perl-mode-hook   '(lambda () (setq indent-tabs-mode nil)))
(add-hook 'java-mode-hook   '(lambda () (setq indent-tabs-mode nil)))
(add-hook 'vhdl-mode-hook   '(lambda () (setq indent-tabs-mode nil)))
(add-hook 'sh-mode-hook     '(lambda () (setq indent-tabs-mode nil)))
(add-hook 'matlab-mode-hook '(lambda () (setq indent-tabs-mode nil)))
(add-hook 'haskell-mode-hook '(lambda () (setq indent-tabs-mode nil)))


;; tab width
(customize-set-variable 'tab-width 2)
(setq-default tab-width 2)

(add-hook 'c-mode-hook      '(lambda ()
                               (setq tab-width 2)
                               (setq c-basic-offset 2)
                               (setq c-indent-level 2)))

(add-hook 'c++-mode-hook      '(lambda ()
                               (setq tab-width 2)
                               (setq c-basic-offset 2)
                               (setq c-indent-level 2)))




;; ;; Auctex stuff
;; ;;(autoload 'TeX-load-hack "tex-site")
;; ;;(TeX-load-hack)
;; (add-to-list 'load-path "~/.emacs.d/elpa")
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)

;; (setq-default TeX-master nil)
;; (setq TeX-parse-self t)
;; (setq TeX-auto-save t)
;; (setenv "PATH" "/opt/local/bin:/bin:/usr/bin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/Current/bin:/Applications/bin:")
;; (list "View PS" "open %s.ps" 'TeX-run-command nil t)
;; (list "View PDF" "open %s.pdf" 'TeX-run-command nil t)

;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(TeX-PDF-mode t)
;;  '(TeX-output-view-style (quote
;;                           (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f")
;;                            ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f")
;;                            ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d")
;;                            ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d")
;;                            ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d")
;;                            ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d")
;;                            ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d")
;;                            ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d")
;;                            ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d")
;;                            ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d")
;;                            ("^dvi$" "." "%(o?)xdvi %dS %d")
;;                            ;;("^pdf$" "." "/Applications/bin/emacs %o")
;;                            ("^pdf$" "." "open %o %(outpage)")
;;                            ("^html?$" "." "firefox %o"))))
;;  '(TeX-shell "/bin/zsh")
;;  '(case-fold-search t)
;;  '(column-number-mode t)
;;  '(current-language-environment "English")
;;  '(global-font-lock-mode t nil (font-lock))
;;  '(show-paren-mode t nil (paren)))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )

;; (add-hook 'LaTeX-mode-hook '(lambda ()
;;                  (TeX-fold-mode 1)
;;                  (outline-minor-mode 1)
;;                    ))

;; ;;(set-default-font "6x12")




;; ;(add-hook 'outline-mode-hook 'my-outline-easy-bindings)
;; ;(add-hook 'outline-minor-mode-hook 'my-outline-easy-bindings)

;; ;(defun my-outline-easy-bindings ()
;; ;  (require 'outline-mode-easy-bindings nil t))


;; (global-set-key (kbd "C-c J") 'flyspell-check-previous-highlighted-word)
;; (global-set-key (kbd "C-c j") 'flyspell-goto-next-error)




;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; python mode
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;;pymacs setup
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")
;; ;;(eval-after-load "pymacs"
;; ;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

;; ;;tab width
;; (add-hook 'python-mode-hook
;;       (lambda ()
;;         (setq python-python-command "python")
;;         (setq indent-tabs-mode nil)
;;         (setq tab-width 2)
;;         (setq python-indent 2)))


;; Don't use TABS for indentations.
(setq-default indent-tabs-mode nil)
(boundp 'me-my-python-tab-width)
(add-hook 'python-mode-hook
          (lambda ()
            (setq-default indent-tabs-mode nil)            
                                        ;(setq indent-tabs-mode t)
            (let ((ptw (if (boundp 'me-my-python-tab-width) me-my-python-tab-width 2)))
              (progn (setq tab-width ptw)
                     (set-variable 'py-indent-offset ptw)            
                     (setq python-indent ptw)))))

(require 'indent-guide)
(add-hook 'python-mode-hook 'indent-guide-mode) 
(add-hook 'ruby-mode-hook 'indent-guide-mode) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Haskell mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; (add-to-list 'auto-mode-alist '("\\.l[hg]s$" . latex-mode))
;; (eval-after-load "tex"
;;   '(progn
;;      ;(add-to-list 'LaTeX-command-style '("lhs" "lhslatex"))
;;      (add-to-list 'TeX-file-extensions "lhs")))


;; ;; load it
;; (add-to-list 'exec-path "~/.emacs.d/elisp/haskell")
;; (add-to-list 'exec-path "~/.cabal/bin")

;; ;; haskell mode configuration
;; (setq auto-mode-alist
;;       (append auto-mode-alist
;;               '(("\\.[hg]s$"  . haskell-mode)
;;                 ("\\.hic?$"     . haskell-mode)
;;                 ("\\.hsc$"     . haskell-mode)
;;                 ("\\.chs$"    . haskell-mode)
;;                 ;("\\.l[hg]s$" . literate-haskell-mode)
;;                 )))
;; (autoload 'haskell-mode "haskell-mode"
;;    "Major mode for editing Haskell scripts." t)
;; (autoload 'literate-haskell-mode "haskell-mode"
;;    "Major mode for editing literate Haskell scripts." t)


;; (defun flymake-haskell-init ()
;;   "When flymake triggers, generates a tempfile containing the
;;   contents of the current buffer, runs `hslint` on it, and
;;   deletes file. Put this file path (and run `chmod a+x hslint`)
;;   to enable hslint: https://gist.github.com/1241073"
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "hslint" (list local-file))))

;; (defun flymake-haskell-enable ()
;;   "Enables flymake-mode for haskell, and sets <C-c d> as command
;;   to show current error."
;;   (when (and buffer-file-name
;;              (file-writable-p
;;               (file-name-directory buffer-file-name))
;;              (file-writable-p buffer-file-name))
;;     (local-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)
;;     (flymake-mode t)))

;; ;; Forces flymake to underline bad lines, instead of fully
;; ;; highlighting them; remove this if you prefer full highlighting.
;; ;; (custom-set-faces
;; ;;  '(flymake-errline ((((class color)) (:underline "red"))))
;; ;;  '(flymake-warnline ((((class color)) (:underline "yellow")))))




;; ;; ;; Ignore compiled Haskell files in filename completions
;; (add-to-list 'completion-ignored-extensions ".hi")




;; (define-key haskell-mode-map (kbd "C-x C-s") 'haskell-mode-save-buffer)



(require 'haskell-mode)
(load "haskell-mode-autoloads.el")


(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'inf-haskell-mode)


(custom-set-variables
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-literate-default 'tex)
 '(haskell-font-lock-symbols t)
 '(haskell-interactive-mode-eval-mode 'haskell-mode)
 '(haskell-tags-on-save t))


(defun my-haskell-mode-hook ()
  "hs-lint binding, plus autocompletion and paredit."
  (local-set-key "\C-cl" 'hs-lint)
  ;; (setq ac-sources
  ;;       (append '(ac-source-yasnippet
  ;;                 ac-source-abbrev
  ;;                 ac-source-words-in-buffer
  ;;                 my/ac-source-haskell)
  ;;               ac-sources))
  ;; (dolist (x '(haskell literate-haskell))
  ;;   (add-hook
  ;;    (intern (concat (symbol-name x)
  ;;                    "-mode-hook"))
  ;;    'turn-on-paredit)))
  )
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
     ))




(defun haskell-interactive-toggle-print-mode ()
  (interactive)
  (setq haskell-interactive-mode-eval-mode
        (intern
         (ido-completing-read "Eval result mode: "
                              '("fundamental-mode"
                                "haskell-mode"
                                "espresso-mode"
                                "ghc-core-mode"
                                "org-mode")))))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;      (setq 
;;      ;; (require 'hs-lint)    ;; https://gist.github.com/1241059
;;      ;; (require 'haskell-ac) ;; https://gist.github.com/1241063
;;      ;; (require 'flymake)
;;      ;; (require 'inf-haskell)
;;      ;; (require 'paredit)
;;      ;; (push '("\\.l?hs\\'" flymake-haskell-init) flymake-allowed-file-name-masks)
;;      ;; (add-hook 'haskell-mode-hook 'flymake-haskell-enable)
;;      ;; (make-local-variable 'mmm-global-mode)
;;      ;; (setq mmm-global-mode 'true)
;;      )))







;; (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
;; (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;; (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;; (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)



;; ;(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)
;; (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)




