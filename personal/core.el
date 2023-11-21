(prelude-require-packages '(quelpa beacon jinx))

;; Highlight the cursor whenever the window scrolls.
(beacon-mode +1)

;; We don't let Emacs kill old buffers before 10 days (the original value is
;; 3).
(setq clean-buffer-list-delay-general 10)

;; Better spell checking.
;; Some keyboard shortcuts are defined in "personal/evil.el".
(defun personal-jinx-mode-defaults ()
  (message "My jinx config")
  (setq jinx-languages "en_US pt_BR"))

(add-hook 'jinx-mode-hook 'personal-jinx-mode-defaults)
(global-jinx-mode +1)

;; magit customization
;; adding the diff option "--ignore-space-at-eol"
;;
;; I used the following doc page as a reference:
;; https://magit.vc/manual/transient/Modifying-Existing-Transients.html
;; `magit-diff' is the prefix we get when we press "d" on the status
;; buffer. `magit-diff-refresh' is the one we get when we press "D".
;; I needed to search for the existing options on magit's repository to find
;; this info.
(with-eval-after-load 'magit
  (require 'magit-diff)
  (require 'transient)

  ;; "append" adds the new command after `-b'.
  (transient-append-suffix 'magit-diff-refresh "-b"
    '("-e" "Ignore space at EOL" ("" "--ignore-space-at-eol"))))
