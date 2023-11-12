(prelude-require-packages '(quelpa))

;; Highlight the cursor whenever the windw scrolls.
(quelpa
 '(beacon
   :fetcher github
   :repo "Malabarba/beacon"
   :commit "85261a928ae0ec3b41e639f05291ffd6bf7c231c"))

(beacon-mode +1)

;; We don't let Emacs kill old buffers before 10 days (the original value is
;; 3).
(setq clean-buffer-list-delay-general 10)
