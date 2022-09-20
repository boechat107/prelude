(set-face-attribute 'default nil :font "Ricty Diminished 10" :weight 'bold)

(prelude-require-packages '(neotree))
(global-set-key [f8] 'neotree-toggle)

(setq scroll-bar-width 5)

;; Automatically enable Git diff at the sides when using Emacs on terminal.
;; Ref.: https://github.com/dgutov/diff-hl/issues/155
(add-hook 'diff-hl-mode-on-hook
          (lambda ()
            (unless (window-system)
              (diff-hl-margin-mode))))
