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
