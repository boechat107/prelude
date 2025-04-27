(prelude-require-packages '(quelpa jinx perspective))

;; Optimizations suggested in the following discussion:
;; https://emacs.stackexchange.com/questions/12086/high-cpu-memory-usage-and-abnormally-large-savehist-file
;; I was experience a similar problem. The profiling report showed a significant
;; CPU consumption by savehist.
(setq history-length 100)
(put 'minibuffer-history 'history-length 50)
(put 'evil-ex-history 'history-length 50)
(put 'kill-ring 'history-length 25)

;; Flyspell also takes a lot of CPU cycles.
;; Suggestion from its homepage: https://www.emacswiki.org/emacs/FlySpell#h5o-4
(setq flyspell-issue-message-flag nil)

;; We don't let Emacs kill old buffers before 10 days (the original value is
;; 3).
(setq clean-buffer-list-delay-general 10)

;; Better spell checking.
;; Some keyboard shortcuts are defined in "personal/evil.el".
(defun personal-jinx-mode-defaults ()
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

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-x x"))  ; pick your own prefix key here
  (persp-state-default-file "~/Codes/perspective.el")
  :init
  (persp-mode)
  :config
  (add-hook 'kill-emacs-hook #'persp-state-save))
