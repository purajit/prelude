;; ;;;
;; ;;; org-config.el -- Org Mode configuration file
;; ;;;


;; (require 'org-compat)
;; (require 'org-install)

(require 'ox-publish)
;; (require 'org-habit)
(add-to-list 'load-path "~/.emacs.d/elpa/org-mode/contrib/lisp")
;; (if (string= me-my-name "Paresh Malalur")
;;     (require 'ox-confluence))
(load "tablet.el")
;;
;; **** File Variables
;;

                                        ; Directory with org files
(setq org-directory "~/.org/")
(setq diary-file "~/.org/diary")

                                        ; Specific files
(setq org-gtd-file (concat org-directory "gtd.org"))
(setq org-checklists-file (concat org-directory "checklists.org"))
(setq org-notes-file (concat org-directory "notes.org"))
(setq org-projects-file (concat org-directory "projects.org"))
(setq org-journal-file (concat org-directory "journal.org"))
(setq org-health-file (concat org-directory "health.org"))
(setq org-semester-file (concat org-directory "class.org"))
(setq org-research-file (concat org-directory "otherProjects.org"))
(setq org-cancer-file (concat org-directory "cancer.org"))
(setq org-cmt-file (concat org-directory "cmt.org"))
(setq org-cog-file (concat org-directory "cog.org"))
(setq org-weiss-file (concat org-directory "weiss.org"))
(setq org-cmt-jira-file "~/.org-jira/MM.org")


(setq org-src-ask-before-returning-to-edit-buffer nil)


;; ;; google calendar imports
;; (setq org-gcal-home-file (concat org-directory "home.ics.org"))
;; ;;(setq org-gcal-school-file (concat org-directory "school.ics.org"))
;; ;(setq org-gcal-impDates-file (concat org-directory "impDates.ics.org"))
;; ;(setq org-gcal-work-file (concat org-directory "work.ics.org"))
;; ; don't really use the workout file
;; ;(setq org-gcal-workout-file (concat org-directory "workout.ics.org"))


;; (setq org-archive-files (list (concat org-gtd-file "_archive")
;;                               (concat org-projects-file "_archive")
;;                               (concat org-semester-file "_archive")
;;                               ))


;; ================================================================

;;
;; **** General settings
;;

                                        ; Set id locations file
(setq org-id-locations-file (concat org-directory ".org-id-locations"))

                                        ; Use ido completion
(setq org-completion-use-ido t)

                                        ; Use speed keys
(setq org-use-speed-commands t)

                                        ; Persist the clock between emacs sessions
                                        ; (setq org-clock-persist 'history)
                                        ; (org-clock-persistence-insinuate)
                                        ; (setq org-clock-persist-file (concat org-directory "org-clock-save.el"))

                                        ; Set clock idle-time
(setq org-clock-idle-time 30)

                                        ; Clock into drawer
(setq org-clock-into-drawer t)

                                        ; Do not show inherited tags in agenda
(setq org-agenda-show-inherited-tags nil)

                                        ; Single keypress exits tag selecter (C-c to override)
(setq org-fast-tag-selection-single-key t)

                                        ; Dim blocked states (use `invisible' to make them invisible instead)
(setq org-agenda-dim-blocked-tasks t)

                                        ; When to launch org-mode
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

                                        ; Ignore timestamped items in global todo lists and tags-todo lists
(setq org-agenda-todo-ignore-with-date 'future)
(setq org-agenda-tags-todo-honor-ignore-options t)

                                        ; Give sub-items of lists different bullets
(setq org-list-demote-modify-bullet
      '(("+" . "-") ("-" . "+") ("*" . "+")))

                                        ; Log state change notes and time stamps into LOGBOOK drawer
(setq org-log-into-drawer t)

                                        ; Log done as closed
(setq org-log-done 'time)

                                        ; 'a' in the agenda buffer will set ARCHIVED tag, so only $ will archive to sibling
(setq org-archive-default-command 'org-archive-set-tag)

                                        ; Org drawers
(setq org-drawers '("PROPERTIES" "CLOCK" "LOGBOOK" "FEEDSTATUS"))

                                        ; Restore window configuration after closing agenda
(setq org-agenda-restore-windows-after-quit t)

                                        ; Tasks cannot be marked done unless all subtasks are
(setq org-enforce-todo-dependencies t)

                                        ; Do not separate headings with blank lines
                                        ;(setq org-cycle-separator-lines 0)

                                        ; Remove automatic newline
                                        ; You can set headings and/or plain lists to auto (the default
                                        ; setting), t (always), or nil (never).
(setq org-blank-before-new-entry nil)

                                        ; Return follows links
(setq org-return-follows-link t)

                                        ; Plain lists ane terminated by empty lines
(setq org-empty-line-terminates-plain-lists t)

                                        ; C-a/e and C-k behave specially in headings
(setq org-special-ctrl-a/e t)
(setq org-special-ctrl-k t)

                                        ; Always adjust yanked tree
(setq org-yank-adjusted-subtree)

                                        ; Hide leading stars
(setq org-hide-leading-stars t)

                                        ; Which applications open which links
(setq org-file-apps
      '((directory . emacs)
        (auto-mode . emacs)
        ("pdf" . system)
        ("txt" . emacs)
        ("tex" . emacs)
        ("org" . emacs)
        ("el" . emacs)
        ("bib" .emacs)
        ("c" . emacs)
        ("cc" . emacs)
        ("cpp" . emacs)
        ("h" . emacs)
        ("hh" . emacs)
        ("hpp" . emacs)))

;;
;; **** Custom Key Bindings
;;
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cO" 'org-open-at-point-global)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-ido-switchb)


;;
;; **** Crypto settings
;;
(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-crypt-key "pareshmg@mit.edu")


;; ================================================================

;;
;; **** Agenda Files
;;

(setq org-agenda-files (list org-gtd-file
                             org-cmt-file
                             org-cancer-file
                             org-projects-file
                             org-checklists-file
                             org-notes-file
                             org-cog-file
                             org-semester-file
                             org-cmt-jira-file
                             ;;org-gcal-home-file
                                        ;org-gcal-work-file
                                        ;org-gcal-school-file
                                        ;org-gcal-impDates-file
                             ))
;;org-projects-file
;;org-projects-dir
;;                             org-checklists-file))

;;
;; **** Tags
;;
(setq org-tag-persistent-alist (quote ((:startgroup)
                                       ("@work" . ?w)
                                       ("@errand" . ?e)
                                       (:endgroup)
                                       ("hacking" . ?c)
                                       ("phone" . ?p)
                                       ("crypt" . ?x)
                                       ("lowbrain" . ?l)
                                       ("medbrain" . ?m)
                                       ("highbrain" . ?h)
                                       ("recurring" . ?r)
                                       ("Urgent" . ?u)
                                       ("Important" . ?i))))


;;
;; **** TODO Keywords
;;
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s@/@)" "|" "DONE(d!)")
        (sequence "WAITING(w@/@)" "AGENDA(a@/@)" "|" "CANCELLED(c@/@)")))

(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
        ("STARTED" :foreground "blue" :weight bold)
        ("DONE" :foreground "green")
        ("WAITING" :foreground "orange" :weight bold)
        ("CANCELLED" :foreground "forest green")))


;;
;; **** Custom agenda commands
;;

(setq org-stuck-projects
      '("+LEVEL=1+PROJECT-config/-DONE"
        ("TODO" "STARTED")
        nil ""))

(setq org-anywhere-tasks
      '(tags-todo "-@work-@hacking-@errand-phone/-WAITING-STARTED"
                  ((org-agenda-overriding-header "Anywhere tasks")
                   (org-agenda-sorting-strategy '(effort-up)))))

(setq org-xall-tasks
      '(tags-todo "-Important-Urgent/-WAITING"
                  ((org-agenda-overriding-header "All tasks")
                   (org-agenda-sorting-strategy '(effort-up)))))

(setq org-agenda-custom-commands
      `(
                                        ; Items in the inbox
        ("i" tags "+LEVEL=2+INBOX"
         ((org-agenda-overriding-header "Inbox")
          (org-agenda-skip-function '(org-agenda-skip-subtree-if 'scheduled))))
                                        ; Loose ends
        ("W" todo "WAITING|STARTED"
         ((org-agenda-overriding-header "Loose Ends (WAITING|STARTED)")))
                                        ; Finished and Cancelled
        ("d" "Finished or Cancelled items"
         ((todo "DONE|CANCELLED"
                ((org-agenda-files '(,org-gtd-file))
                 (org-agenda-overriding-header "Finished or Cancelled Next Actions")))
          (todo "DONE|CANCELLED"
                ((org-agenda-files (remove org-gtd-file org-agenda-files))
                 (org-agenda-overriding-header "Finished or Cancelled Project Tasks")))))
                                        ; Someday/Maybe
        ("S" tags "+LEVEL=2+SOMEDAY")
                                        ; Context Specific
                                        ;        ("c" . "Context todos")
        ;; ("h" "@Home tasks"
        ;;  ((agenda "")
        ;;   (tags-todo "+@home|phone/-WAITING-STARTED"
        ;;              ((org-agenda-sorting-strategy '(effort-up))))
        ;;   ,org-anywhere-tasks))
        ("e" "@Extended task view"
         ((agenda "" ((org-agenda-ndays 7)                      ;; overview of appointments
                      (org-agenda-start-on-weekday nil)         ;; calendar begins today
                      (org-agenda-repeating-timestamp-show-all t)))
                                        ;(org-agenda-entry-types '(:timestamp :sexp))))

          (tags "+Urgent/-DONE"
                ((org-agenda-sorting-strategy '(effort-up))))
          (tags "+Important-Urgent/-WAITING-DONE"
                ((org-agenda-sorting-strategy '(effort-up))))
          ,org-xall-tasks))
        ("w" "@Work tasks"
         ((agenda "")
          (tags-todo "+@work|phone/-WAITING-STARTED-DONE"
                     ((org-agenda-sorting-strategy '(effort-up))))
          ,org-anywhere-tasks))
        ("o" tags-todo "+@errand")
        ("c" tags-todo "+hacking")
        ("p" tags-todo "+phone")
                                        ; Archived log-view
        ("A" "Archived log view"
         ((agenda ""
                  ((org-agenda-files (append org-archive-files org-agenda-files))))))
        ))

;;
;; **** Columns and effort
;;

(setq org-global-properties
      '(("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00")))
(setq org-columns-default-format "%45ITEM %Effort(Estimated Effort) %TAGS")

;;
;; **** Refile setup
;;

                                        ; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets
      (list '(org-gtd-file . (:maxlevel . 1))
            '(org-projects-file . (:maxlevel . 1))
            '(nil . (:maxlevel . 1))
            '(org-agenda-files . (:tag . "REFILE"))))

                                        ; Do not include config targets when refiling
(setq org-refile-target-verify-function
      (lambda ()
        (if (string-equal "config" (car (org-get-local-tags)))
            (progn (org-end-of-subtree t) nil)
          t)))

;;
;; **** Capture
;;

(setq org-default-notes-file (concat org-directory "gtd.org"))

(setq org-capture-templates
      `(
                                        ; Generic next action
        ("t" "Next Action" entry (file+headline ,org-gtd-file "Next Actions")
         "* TODO %?\n %i")
                                        ; Grocery action
        ("g" "To get" entry (file+headline ,org-gtd-file "To buy")
         "* %?\n %i")
                                        ; Waiting for action
        ("w" "Waiting for" entry (file+headline ,org-gtd-file "Next Actions")
         "* WAITING %?\n %i")
                                        ; Appointment
        ("a" "Appointment" entry (file+headline ,org-gtd-file "Next Actions")
         "* %?\n  %^{Time}T%^{LOCATION}p")
                                        ; Generic inbox item
        ("i" "Idle" entry (file+headline ,org-gtd-file "Idle")
         "* TODO %?\n %i")
                                        ; Inbox item with context
        ("I" "Inbox (with context)" entry (file+headline ,org-gtd-file "Inbox")
         "* %?\n %i\n %U\n %a")
                                        ; Journal entry
        ("j" "Journal" entry (file+datetree ,org-journal-file)
         "* %?\n\n  Entered on %U\n %i")
                                        ; Health log
        ("h" "Health Log" entry (file+datetree ,org-health-file)
         "* %?\n\n  Entered on %U\n %i")
                                        ; Someday/Maybe items
        ("s" "Someday/Maybe" entry (file+headline ,org-gtd-file "Someday/Maybe")
         "* %?\n %i")
                                        ; Classes capture
        ("c" "Class" entry (file+headline ,org-semester-file "9.660")
         "* TODO %?\n  DEADLINE: %^{Due}t")

                                        ; Research capture
        ("r" "Research Templates")
        ("rt" "Cog Research" entry (file+headline ,org-cog-file "Todo")
         "* TODO %?\n  %i")
        ("rh" "CMT Related" entry (file+headline ,org-cmt-file "Todo")
         "* TODO %?\n  %i")
        ))


;;
;; **** ReQuall
;;

(setq org-feed-alist
      (list
       (list "ReQuall" "https://www.reqall.com/user/feeds/rss/GETYOUROWNDAMNFEED!!!!"
             org-gtd-file "Inbox")))
(setq xml-entity-alist nil)


;;
;; **** iCal integration
;;

(setq org-icalendar-use-scheduled
      '(event-if-todo		; Scheduling time stamps in TODO entries become an event.
        event-if-not-todo	; Scheduling time stamps in non-TODO entries become an event.
        todo-start		; Scheduling time stamps in TODO entries become start date.
        ))

(setq org-icalendar-use-deadline
      '(event-if-todo		; Scheduling time stamps in TODO entries become an event.
        event-if-not-todo	; Scheduling time stamps in non-TODO entries become an event.
        todo-start		; Scheduling time stamps in TODO entries become start date.
        ))

(setq org-calendar-server "/Library/WebServer/Documents/")
(add-hook 'org-after-save-iCalendar-file-hook
          (lambda ()
            (shell-command
             (concat "mv " org-directory "*.ics " org-calendar-server))))


(add-hook 'org-publish-before-export-hook
          (lambda ()
            (org-babel-tangle)))

;; To view Emacs diary entries in the org agenda
(setq org-agenda-include-diary t)

;;
;; **** Org update command
;;

(defun org-update-gtd ()
  (interactive)
  (org-feed-update-all)
  (org-agenda-to-appt '((tag "APPT"))))


;; ================================================================
;; Hacks

;;
;; **** Get completing read to work correctly
;;

(defadvice org-completing-read (around space-bug-around first nil activate protect)
  "Workaround for getting space to act normally when using
org-completing-read to complete."
  (let ((pc-mode (and (boundp 'partial-completion-mode)
                      partial-completion-mode)))
    (if pc-mode (partial-completion-mode -1))
    ad-do-it
    (if pc-mode (partial-completion-mode 1)))
  )

;;
;; **** Retroactive logging
;;
(setq org-custom-time nil)
(setq org-redated-commands-so-far 0)

(defun org-unredate ()
  (if (> org-redated-commands-so-far 0)
      (progn
        (setq org-redated-commands-so-far 0)
        (setq org-custom-time nil)
        (remove-hook 'pre-command-hook 'org-unredate))
    (setq org-redated-commands-so-far (+ org-redated-commands-so-far 1))))

(defun org-redate-next-command ()
  (interactive)
  (setq org-custom-time (org-read-date t t))
  (add-hook 'pre-command-hook 'org-unredate 'append)
  )

(defadvice current-time (around org-time-injector first nil activate)
  "Allows one to inject custom times into any function that calls
  current-time by first binding the variable custom-time to the
  desired time"
  (if org-custom-time
      (setq ad-return-value org-custom-time)
    ad-do-it))


;;
;; **** Diary SEXPS
;;
(defun diary-monthiversary (month day year &optional mark)
  (let* ((ddate (diary-make-date month day year))
         (mm (calendar-extract-month ddate))
         (m (calendar-extract-month date))
         (yy (calendar-extract-year ddate))
         (y (calendar-extract-year date))
         (dd (calendar-extract-day ddate))
         (d (calendar-extract-day date))
         (mdiff (- m mm))
         (ydiff (- y yy))
         (month-diff (+ mdiff (* ydiff 12))))
    (and (eq d dd)
         (cons mark (format entry month-diff (diary-ordinal-suffix month-diff))))))



(defun diary-weekiversary (month day year &optional mark)
  (let* ((ddate (diary-make-date month day year))
         (dd (calendar-absolute-from-gregorian ddate))
         (d (calendar-absolute-from-gregorian date))
         (diff (- d dd))
         (weekdiff (/ diff 7)))
    (and (> diff 0) (eq (mod diff 7) 0)
         (cons mark (format entry weekdiff (diary-ordinal-suffix weekdiff))))))

;;
;; **** Org-Mode Hook
;;

(defun my-org-mode-hook ()
                                        ; RET should be newline-and-indent
  (local-set-key (kbd "RET") 'org-return-indent)
                                        ; Redate with C-c R
  (local-set-key "\C-cR" 'org-redate-next-command)
  (local-set-key (kbd "C-c C-SPC i") 'tablet-create-default-image-and-org-link)
  (local-set-key (kbd "C-c C-SPC w i") 'tablet-create-white-image-and-org-link)
  (local-set-key (kbd "C-c C-SPC t i") 'tablet-create-transparent-image-and-org-link)
  (local-set-key (kbd "C-c C-SPC p") 'tablet-create-default-page-and-org-link)
  (local-set-key (kbd "C-c C-SPC t p") 'tablet-create-transparent-page-and-org-link)
  (local-set-key (kbd "C-c C-SPC w p") 'tablet-create-white-page-and-org-link)
  (local-set-key (kbd "C-c C-SPC t z") 'tablet-create-tikz-fig-and-org-link)
  (local-set-key (kbd "C-c D") 'org-decrypt-entry)
  (local-unset-key (kbd "S-<left>"))
  (local-unset-key (kbd "S-<right>"))
  (local-unset-key (kbd "S-<up>"))
  (local-unset-key (kbd "S-<down>"))
  (auto-fill-mode)
  ;; (condition-case nil
  ;;     (flyspell-mode)
  ;;   (error nil))
  )

(add-hook 'org-mode-hook 'my-org-mode-hook)

(defun my-org-agenda-mode-hook()
  (local-unset-key (kbd "C-c r"))
  (local-set-key (kbd "C-c r") 'org-capture)
  )

(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-hook)


;; MobileOrg stuff
;;(setq org-agenda-tag-filter org-agenda-filter)

(setq org-mobile-inbox-for-pull "~/.org/notes.org")
(setq org-mobile-directory "~/Documents/Dropbox/MobileOrg")



;;;; Configuration in Babel
;; http://orgmode.org/worg/org-contrib/babel/languages/ob-doc-LaTeX.html
;;Activate LaTeX Evaluation

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . nil)
   (ditaa . nil)
   (dot . nil)
   (emacs-lisp . t)
   (gnuplot . nil)
   (haskell . nil)
   (latex . t) ; this is the entry to activate LaTeX
   (ocaml . nil)
   (perl . t)
   (python . t)
   (ruby . t)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . nil)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Have :CREATED: log in logbook entry
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; added "created" type
(setq org-log-note-headings
      '((done .  "CLOSING NOTE %t")
        (state . "State %-12s from %-12S %t")
        (note .  "Note taken on %t")
        (reschedule .  "Rescheduled from %S on %t")
        (redeadline .  "New deadline from %S on %t")
        (created .  "CREATED %t")
        (clock-out . "")))

;; for TODOs created in the buffer
(defun pah/insert-creation-date ()
  "Insert CREATED timestamp into logbook"
  (interactive)
  (org-add-log-setup 'created nil nil 'findpos
                     'time))

(defun bh/insert-inactive-timestamp ()
  (interactive)
  (org-insert-time-stamp nil t t nil nil nil))

(defun bh/insert-heading-inactive-timestamp ()
  (save-excursion
    (org-return)
    (org-cycle)
    (pah/insert-creation-date)))
                                        ;(bh/insert-inactive-timestamp)))

                                        ;(add-hook 'org-insert-heading-hook 'bh/insert-heading-inactive-timestamp)


(add-hook 'org-insert-heading-hook 'pah/insert-creation-date)


;; for remember
(setq org-remember-templates (quote (("todo" ?t "* TODO %?\n  :LOGBOOK:\n  -
CREATED:%U\n  :END:\n" nil bottom  nil))))
(global-set-key "\C-\M-y" 'yas/expand)
(global-set-key "\C-\M-y" 'yas-expand)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Org publish stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun my-org-publish (plist filename pubdir)
  (require 'org)
  (progn
    (message "publishing")
    (org-html-publish-to-html plist filename pubdir)
    (org-babel-tangle-file filename (plist-get plist :tangle-directory))))


(setq org-publish-project-alist
      '(
        ("cog-org"
         :base-directory "/Users/pareshmg/Research/cog/resources/writeups/"
         :publishing-directory "/Users/pareshmg/Research/cog/resources/html/"
         :tangle-directory "/Users/pareshmg/Research/cog/source/"
         :base-extension "org"
         :auto-preamble f
         :recursive t
         :publishing-function my-org-publish ;org-publish-org-to-html
         )
        ("cog-static"
         :base-directory "/Users/pareshmg/Research/cog/resources/writeups/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "/Users/pareshmg/Research/cog/resources/html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("cog-data"
         :base-directory "/Users/pareshmg/Research/cog/source/Clustering/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "/Users/pareshmg/Research/cog/resources/html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("cog" :components ("cog-org" "cog-static" "cog-data"))
        ))

;; latex export newcommand header
(org-add-link-type
 "latex" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<span class=\"%s\">%s</span>" path desc))
    ((eq format 'latex)
     (format "\\%s{%s}" path desc)))))

(defun org-get-tangle-path (fname)
  "Tangle get source path"
  ;;(interactive)
  (if (boundp 'filename)
      (concat (plist-get (cdr (org-publish-get-project-from-filename filename)) :tangle-directory) fname)
    (concat (plist-get (cdr (org-publish-get-project-from-filename (buffer-file-name))) :tangle-directory) fname)))

(defun my-detangle ()
  (interactive)
  (let ((origBuf (current-window-configuration)))
    (progn
      (org-babel-detangle)
      (save-buffer)
      (set-window-configuration origBuf))))

(add-hook 'after-save-hook
          (lambda ()
            (let ((ext (car (last (split-string (buffer-file-name) "\\.")))))
              (if (not (equal ext "org"))
                  (ignore-errors (my-detangle))))))

;;http://lists.gnu.org/archive/html/emacs-orgmode/2012-08/msg01388.html
(setq org-image-actual-width nil)


;;; org-config.el ends here
