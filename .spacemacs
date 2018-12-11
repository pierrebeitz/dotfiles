;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
    dotspacemacs-configuration-layers
    '(
       sql
       windows-scripts
       nginx
       ;; ----------------------------------------------------------------
       ;; Example of useful layers you may want to use right away.
       ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
       ;; <M-m f e R> (Emacs style) to install them.
       ;; ----------------------------------------------------------------

       (auto-completion :variables
         auto-completion-enable-sort-by-usage t
         auto-completion-enable-help-tooltip t
         auto-completion-enable-snippets-in-popup t
         spacemacs-default-company-backends '(company-dabbrev-code
                                               company-gtags
                                               company-etags
                                               company-keywords
                                               company-files
                                               company-dabbrev
                                               company-elm)
         )
       better-defaults
       crystal
       clojure
       elixir
       elm
       emacs-lisp
       (git :variables
         git-magit-status-fullscreen t
         git-variable-example nil)
       helm
       html
       javascript
       journal
       markdown
       (ruby :variables ruby-version-manager 'rvm)
       ;; ruby-on-rails
       org
       php
       ;; (python :variables python-enable-yapf-format-on-save t)
       syntax-checking
       typescript
       version-control
       (shell :variables
         shell-default-term-shell "/bin/zsh"
         shell-default-shell 'term)
       yaml
       )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ;; apib-mode
     ;; rainbow-mode
     add-node-modules-path
     editorconfig
     gruvbox-theme
     org-journal
     ;; plantuml-mode
     prettier-js
     elm-mode

     ;; rufo
     ;; sr-speedbar
     vue-mode
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(spacemacs-dark
                          gruvbox-dark-soft
                          spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (load-theme 'gruvbox-dark-soft t)

  ;; (require 'helm-bookmark)


  (global-set-key (kbd "C-s") 'save-buffer)
  (global-set-key (kbd "C-i") 'evil-jump-forward)

  (global-set-key (kbd "M-h") 'evil-window-left)
  (global-set-key (kbd "M-l") 'evil-window-right)
  (global-set-key (kbd "M-j") 'evil-window-down)
  (global-set-key (kbd "M-k") 'evil-window-up)

  ;; (global-set-key (kbd "<C-S-up>") 'shrink-window)
  ;; (global-set-key (kbd "<C-S-down>") 'enlarge-window)
  ;; (global-set-key (kbd "<C-S-h>") 'shrink-window-horizontally)
  ;; (global-set-key (kbd "<C-S-l>") 'enlarge-window-horizontally)

  ;; (load-file "~/.rvm/gems/ruby-2.3.3/gems/rcodetools-0.8.5.0/rcodetools.el")

  ;; (define-key evil-motion-state-map (kbd "C-h") #'evil-window-left)
  ;; (define-key evil-motion-state-map (kbd "C-j") #'evil-window-down)
  ;; (define-key evil-motion-state-map (kbd "C-k") #'evil-window-up)
  ;; (define-key evil-motion-state-map (kbd "C-l") #'evil-window-right)

  ;; (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  ;; (define-key evil-visual-state-map "k" 'evil-previous-visual-line)
  ;; (define-key evil-normal-state-map "j" 'evil-next-visual-line)
  ;; (define-key evil-normal-state-map "k" 'evil-previous-visual-line)
  ;; (define-key evil-normal-state-map "ZZ" 'evil-write)
  ;; (define-key evil-normal-state-map (kbd "C->") 'evil-window-increase-width)
  ;; (define-key evil-normal-state-map (kbd "C-<") 'evil-window-decrease-width)

  ;; (define-key evil-normal-state-map "\M-p" 'evil-paste-pop)
  ;; (define-key evil-normal-state-map "\C-p" 'helm-projectile-find-file)
  (define-key key-translation-map [f5] (kbd "C-c C-c"))
  (global-set-key [f9] 'sort-lines)

  (setq js2-include-node-externs t)

  (add-hook 'elixir-mode-hook
    (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

  (add-hook 'elixir-format-hook (lambda ()
                                  (if (projectile-project-p)
                                    (setq elixir-format-arguments
                                      (list "--dot-formatter"
                                        (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
                                    (setq elixir-format-arguments nil))))


  ;; (when (eq dotspacemacs-editing-style 'vim)
  ;;   (evil-define-key 'insert term-raw-map
  ;;     (kbd "C-k") 'evil-window-up
  ;;     (kbd "C-j") 'evil-window-down))
  ;; (evil-define-key 'normal term-raw-map
  ;;   (kbd "C-k") 'evil-window-up
  ;;   (kbd "C-j") 'evil-window-down)

  ;; Keeping files in sync
  (global-auto-revert-mode 1)
  (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-verbose nil)
  (setq revert-without-query '(".*")) ;; disable revert query

  ;; fix annoying neotree bug
  (setq helm-split-window-inside-p t)

  ;; projectile-switch-project-action 'neotree-projectile-action
  (setq
   ;; browse-url-browser-function 'browse-url-generic
   ;; browse-url-generic-program "google-chrome"
   create-lockfiles nil ;; Don't create lockfiles
   elm-format-on-save t
   ;; engine/browser-function 'browse-url-generic
   ;; magit-repository-directories '("~/code/")
   org-agenda-files '("~/org")
   org-agenda-ndays 7
                                        ; org-agenda-skip-deadline-if-done t
                                        ; org-agenda-skip-scheduled-if-done t
   org-agenda-tags-todo-honor-ignore-options t
   org-agenda-todo-ignore-deadlines t
   org-agenda-todo-ignore-scheduled t
   org-agenda-custom-commands '(("cx" "TODOs sorted by state, priority, effort" todo "*"
                                 ((org-agenda-overriding-header "\nTODOs sorted by state, priority, effort")
                                  (org-agenda-sorting-strategy '(todo-state-down priority-down effort-up)))))
   org-confirm-babel-evaluate nil
   org-clock-mode-line-total 'current

   spaceline-org-clock-p t

   ;; org-default-notes-file (concat org-directory "/notes.org")
   org-timer-default-timer 25

   ;; neo-hidden-regexp-list '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "^__pycache__" "^node_modules" "^elm_stuff")
   ;; (add-to-list 'auto-mode-alist '("\\.blade\\.php" . web-mode))

    ruby-deep-indent-paren nil
    ruby-use-smie nil
    enh-ruby-deep-indent-paren nil
    ruby-deep-indent-paren-style nil
   )

  (display-time)
  (editorconfig-mode 1)

  (add-hook 'js-mode-hook  'prettier-js-mode)
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'add-node-modules-path)
  (add-hook 'web-mode-hook 'prettier-js-mode)

  (defun enable-minor-mode (my-pair)
    "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
    (if (buffer-file-name)
        (if (string-match (car my-pair) buffer-file-name)
            (funcall (cdr my-pair)))))
  (add-hook 'web-mode-hook #'(lambda () (enable-minor-mode '("\\.jsx?\\'" . prettier-js-mode))))

  (defun me/org-todo () (interactive)(find-file "~/org/TODOs.org"))
  ;; (evil-leader/set-key "o t" 'me/org-todo)
  (spacemacs/set-leader-keys "ot" #'me/org-todo)

  (setq-default
    flycheck-phpcs-standard "PSR2"
    flycheck-disabled-checkers '(javascript-jscs)
    js-indent-level 2
    js2-basic-offset 2
  )

  ;; (setq-default git-magit-status-fullscreen t)

  ;; (bind-key "<f6>" 'org-todo-list)

  ;; active Org-babel languages
  (setq org-plantuml-jar-path (expand-file-name "~/projects/helpers/plantuml.jar"))

  ;; error prone?
  (add-to-list 'org-babel-load-languages '(plantuml . t))
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t) (ruby . t)))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(evil-want-Y-yank-to-eol nil)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(linum-delay t)
 '(linum-eager nil)
 '(magit-diff-arguments
   (quote
    ("--ignore-all-space" "--no-ext-diff" "--stat" "-M")))
 '(org-agenda-files
   (quote
    ("/Users/pierrebeitz/org/TODOs.org" "/Users/pierrebeitz/org/private.org")))
 '(org-capture-templates
   (quote
    (("c" "Inbox" entry
      (file+headline "~/org/TODOs.org" "Inbox")
      ""))))
 '(package-selected-packages
   (quote
    (treepy graphql sesman inf-crystal play-crystal ob-crystal flycheck-crystal crystal-mode ameba powershell nginx-mode gitlab sql-indent git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl flycheck-flow org-mime wgrep smex ivy-hydra counsel-projectile counsel swiper gruvbox-dark-soft-theme add-node-modules-path clojure-snippets clj-refactor edn paredit peg cider-eval-sexp-fu cider seq queue clojure-mode helm-gtags ggtags sr-speedbar company-quickhelp company-tern tern ivy rufo ghub let-alist intero hlint-refactor hindent helm-hoogle haskell-snippets company-ghci company-ghc ghc haskell-mode cmm-mode ibuffer-projectile writegood-mode dictcc f csv-mode edit-indirect org-category-capture json-reformat dash s vue-mode ssass-mode vue-html-mode pony-mode spray rainbow-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic mu4e-maildirs-extension mu4e-alert ht plantuml-mode yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tide typescript-mode tagedit spaceline powerline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv rainbow-delimiters pug-mode projectile-rails rake inflections prettier-js popwin phpunit phpcbf php-auto-yasnippets persp-mode pcre2el paradox spinner orgit org-projectile org-present org-pomodoro alert log4e gntp org-journal org-download org-bullets open-junk-file ob-elixir neotree mwim multi-term move-text mmm-mode minitest markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint less-css-mode json-snatcher js2-refactor multiple-cursors js-doc info+ indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode gruvbox-theme autothemer google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck-mix flycheck-elm flycheck-credo flycheck flx-ido flx fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help emmet-mode elm-mode elisp-slime-nav editorconfig dumb-jump drupal-mode diminish define-word company-web web-completion-data dash-functional column-enforce-mode clean-aindent-mode chruby bundler inf-ruby bind-map bind-key auto-yasnippet auto-highlight-symbol auto-compile packed alchemist elixir-mode pkg-info epl ace-link ace-jump-helm-line helm helm-core ac-ispell auto-complete popup yasnippet undo-tree json-mode js2-mode hydra company-statistics company coffee-mode async aggressive-indent adaptive-wrap ace-window avy php-extras php-mode org-plus-contrib evil-unimpaired)))
 '(paradox-github-token t)
 '(phpcbf-standard "PSR2")
 '(plantuml-jar-path "/Users/pierrebeitz/projects/helpers/plantuml.jar")
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
