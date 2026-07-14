;; https://emacsredux.com/blog/2025/03/28/speed-up-emacs-startup-by-tweaking-the-gc-settings/  -*- lexical-binding: t; -*-
;; Disable toolbars, menus, and other visual elements for faster startup:

(setq gc-cons-threshold most-positive-fixnum)

;; https://github.com/d12frosted/homebrew-emacs-plus/issues/320#issuecomment-1272348974
(add-to-list 'default-frame-alist '(undecorated-round . t))

;; https://emacs.takeokunn.org/early-init
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(visual-line-mode 1)
(global-so-long-mode 1)
(electric-pair-mode t)
;; source: https://the-pi-guy.com/blog/emacs_performance_optimization_tips_and_tricks_for_speeding_up_your_workflow/
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq line-number-display-limit large-file-warning-threshold)
(setq line-number-display-limit-width 200)

(setq site-run-file nil)
(setq inhibit-startup-screen t
	  initial-scratch-message nil
	  initial-major-mode 'fundamental-mode
	  inhibit-startup-message t
	  inhibit-startup-echo-area-message t)

(setq package-enable-at-startup nil)

(defun display-startup-echo-area-message ()
  (message ""))

(run-with-idle-timer 8 t #'garbage-collect)

;; https://emacs.takeokunn.org/early-init
(setq inhibit-compacting-font-caches t)
(advice-add 'x-apply-session-resources :override 'ignore)
;;(setq default-directory "~/")
;;(setq command-line-default-directory "~/")
(setq ring-bell-function 'ignore)
(setq read-process-output-max (* 8 1024 1024))
(setq garbage-collection-messages nil)
(setq make-backup-files nil
	  auto-save-default nil
	  auto-save-list-file-prefix nil
	  create-lockfiles nil)
(setq byte-compile-warnings '(cl-functions))
(setq history-delete-duplicates t)
(setq vc-follow-symlinks t)

;; https://danielorihuela.dev/blog/optimize-emacs-start-up-time/
(setq max-lisp-eval-depth 1000)
(setq package-enable-at-startup nil)

;; tweak native compilation settings
(setq native-comp-speed 2)
(setq load-prefer-newer t)

(setq gc-cons-threshold (* 1024 1024 100)) ;; 100 MiB
