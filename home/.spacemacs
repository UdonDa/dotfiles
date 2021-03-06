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
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; local packages
     skk

     ;; non-progn packages
     better-defaults
     git
     github
     markdown
     csv

     ;; programming language
     emacs-lisp
     go
     html
     javascript
     ruby
     (python
      :variables
      python-test-runner 'pytest
      python-enable-yapf-format-on-save t
      )
     django
     c-c++
     latex
     sql
     typescript

     auto-completion                    ;; should be lower
     syntax-checking

     ;; fun
     games
     xkcd
     speed-reading

     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      howm
                                      autoinsert
                                      ;; tabbar
                                      ;; ddskk
                                      rainbow-mode
                                      git-gutter
                                      desktop
                                      twittering-mode
                                      wakatime-mode

                                      ;; file editing modes
                                      editorconfig
                                      nginx-mode
                                      dockerfile-mode
                                      toml-mode
                                      lua-mode
                                      magic-latex-buffer
                                      graphviz-dot-mode
                                      terraform-mode

                                      yaml-mode
                                      ;; slack
                                      alert
                                      emojify
                                      ag
                                      navi2ch
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
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
   dotspacemacs-editing-style 'emacs
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
   dotspacemacs-themes '(
                         zenburn
                         spacemacs-dark
                         ;; spacemacs-light
                         ;; solarized-light

                         ;; solarized-dark
                         ;; leuven
                         monokai
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Ricty"
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
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
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
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
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
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."

  ;; I appear to be setting environment variables ("PATH") in your .bashrc or .zshrc
  (setq exec-path-from-shell-check-startup-files nil)

  (define-key global-map (kbd "M-?") 'help-for-help) ; ヘルプ
  (global-set-key (kbd "C-h") 'delete-backward-char)
  ;; (global-set-key (kbd "C-c i") 'indent-region)             ; インデント ;M-m j =
  ;; (global-set-key (kbd "C-c C-i") 'hippie-expand)          ; 補完
  (global-set-key (kbd "C-c ;") 'comment-dwim) ; コメントアウト
  (global-set-key (kbd "M-C-g") 'grep)         ; grep
  ;; (global-set-key (kbd "C-[ M-C-g") 'goto-line)         ; 指定行へ移動
  (global-set-key (kbd "C-c #") 'hs-toggle-hiding)  ; 折りたたみトグル
  (global-set-key (kbd "M-y") 'helm-show-kill-ring) ; yank list
  (global-set-key (kbd "C-x f") 'helm-find-files)   ;
  ;; (global-set-key (kbd "C-x C-r") 'helm-recentf)       ;
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "C-M-x") 'execute-extended-command) ;
  (global-set-key (kbd "C-c C-f") 'helm-for-files)    ;
  (global-set-key (kbd "C-s-n") 'next-multiframe-window)     ;次のウィンドウ
  (global-set-key (kbd "C-s-p") 'previous-multiframe-window) ;
  ;; (global-set-key (kbd "C-x C-j") 'skk-mode)
  (global-set-key (kbd "C-x C-b") 'ibuffer) ;buffer-listより高級なリスト
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
  (global-set-key (kbd "C-c <left>") 'windmove-left)
  (global-set-key (kbd "C-c <right>") 'windmove-right)
  (global-set-key (kbd "C-c <up>") 'windmove-up)
  (global-set-key (kbd "C-c <down>") 'windmove-down)
  (global-set-key [f5] 'revert-buffer)
  ;; (global-set-key (kbd "C-<f3>") 'ahs-highlight-now)
  ;; (global-set-key (kbd "M-<f3>") ')
  (global-set-key (kbd "<f3>")   'ahs-forward)
  (global-set-key (kbd "S-<f3>") 'ahs-backward)

  ;; ================その他================
  (auto-image-file-mode t)                ; 画像ファイルを表示
  (menu-bar-mode -1)                      ; メニューバーを消す
  (tool-bar-mode -1)                      ; ツールバーを消す
  (blink-cursor-mode 1)                   ; カーソルの点滅をする
  (setq eval-expression-print-length nil) ; evalした結果を全部表示
  (show-paren-mode 1)                     ; 対応する括弧を光らせる。
  (setq visible-bell t)                   ; visible bell
  (setq show-paren-delay 0)
  ;; (setq show-paren-style 'mixed) ; ウィンドウ内に収まらないときだけ括弧内も光らせる。
  (setq kill-whole-line t) ; 行の先頭でC-kを一回押すだけで行全体を消去する
  (setq require-final-newline t)          ; 最終行に必ず一行挿入する
  (setq next-line-add-newlines nil) ; バッファの最後でnewlineで新規行を追加するのを禁止する
  (icomplete-mode 1)                ; 補完可能なものを随時表示
  (setq history-length 100000)      ; 履歴数を大きくする
  (savehist-mode 1)                 ; ミニバッファの履歴を保存する
  (auto-compression-mode t)         ; gzファイルも編集できるようにする
  (setq ediff-window-setup-function 'ediff-setup-windows-plain) ; ediffを1ウィンドウで実行
  (setq diff-switches '("-u" "-p" "-N")) ; diffのオプション
  (setq vc-follow-symlinks t)   ; auto-follow version controlled symlink
  (setq suggest-key-bindings t) ; suggest keybinding
  (fset 'yes-or-no-p 'y-or-n-p) ; y/n
  (setq tab-indent-width 2)
  (setq indent-tabs-mode nil)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain) ; コントロール用のバッファを同一フレーム内に表示
  (setq ediff-split-window-function 'split-window-horizontally) ; diffのバッファを上下ではなく左右に並べる
  (setq-default indicate-empty-lines t)   ; バッファの終端を表示
  ;; (setq gc-cons-threshold 268435456)      ; no GC until 256 MiB
  (setq make-backup-files nil)            ; no ~

  ;;show [EOF] at EOF
  (defun set-buffer-end-mark()
    (let ((overlay (make-overlay (point-max) (point-max))))
      (overlay-put overlay 'before-string #("[EOF]" 0 5 (face highlight)))
      (overlay-put overlay 'insert-behind-hooks
                   '((lambda (overlay after beg end &optional len)
                       (when after
                         (move-overlay overlay (point-max) (point-max))))))))
  (add-hook 'find-file-hooks 'set-buffer-end-mark)

  (add-to-list 'auto-mode-alist '("\.gas\\'" . js2-mode))
  (setq js2-basic-offset 2)

  ;; desktop-mode
  (setq desktop-load-locked-desktop t)
  (desktop-save-mode 1)
  (defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
  (add-hook 'auto-save-hook 'my-desktop-save)

  ;; skk-aquamarine が後に読み込まれるようにする
  (require 'skk nil t)
  ;; slack
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; (when window-system
  ;;   ;; (set-face-attribute 'default nil
  ;;   ;;                     :family "Inconsolata"
  ;;   ;;                     :height 100)
  ;;   )
  ;; 〜～
  ;; (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty"))

  ;; not works well in user-init
  (global-set-key (kbd "C-z") 'undo)                ; undo

  ;; =================
  ;; autoinsert
  ;; =================
  (setq user-id-string (getenv "USER"))
  (setq user-name-string (getenv "USERNAME"))
  (setq user-mail-address (getenv "EMAIL"))
  (setq auto-insert-directory "~/.emacs.d/private/local/templates")
  ;; (setq-default auto-insert-alist
  ;;               (nconc '(
  ;;                        ;; ファイル名で決定されるもの
  ;;                        ("setup\\.py\\'" . ["template.setup.py" my-template])
  ;;                        ("urls\\.py\\'" . ["template.urls.py" my-template])
  ;;                        ("README\\.md\\'" . ["template.README.md" my-template])
  ;;                        ;; 拡張子で決定されるもの
  ;;                        ("\\.rst\\'" . ["template.rst" my-template])
  ;;                        ("\\.py\\'" . ["template.py" my-template])
  ;;                        ("\\.c\\'" . ["template.c" my-template])
  ;;                        ("\\.sh\\'" . ["template.sh" my-template])
  ;;                        ("\\.gas\\'" . ["template.gas" my-template])
  ;;                        ("\\.php\\'" . ["template.php" my-template])
  ;;                        ("\\.go\\'" . ["template.go" my-template])
  ;;                        ("\\.html\\'" . ["template.html" my-template])
  ;;                        ) auto-insert-alist))
  (setq auto-insert-alist
        '(
          ;; ファイル名で決定されるもの
          ("setup\\.py\\'" . ["template.setup.py" my-template])
          ("_test\\.py\\'" . ["_test.py" my-template])
          ("urls\\.py\\'" . ["template.urls.py" my-template])
          ("README\\.md\\'" . ["template.README.md" my-template])
          ;; 拡張子で決定されるもの
          ("\\.rst\\'" . ["template.rst" my-template])
          ("\\.py\\'" . ["template.py" my-template])
          ("\\.c\\'" . ["template.c" my-template])
          ("\\.sh\\'" . ["template.sh" my-template])
          ("\\.gas\\'" . ["template.gas" my-template])
          ("\\.php\\'" . ["template.php" my-template])
          ("\\.go\\'" . ["template.go" my-template])
          ("\\.html\\'" . ["template.html" my-template])))
  (setq auto-insert-query nil)            ; Always inserts template.

  (defvar template-replacements-alists
    '(("%file%"             . (lambda () (file-name-nondirectory (buffer-file-name))))
      ("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
      ("%directory%" . (lambda () (file-name-nondirectory (directory-file-name (file-name-directory buffer-file-name)))))
      ("%date%" . (lambda() (current-time-string)))
      ("%id%" . (lambda () (identity user-id-string)))
      ("%name%" . (lambda () (identity user-name-string)))
      ("%mail%" . (lambda () (identity user-mail-address)))
      ))

  (defun my-template ()
    (time-stamp)
    (mapc #'(lambda(c)
              (progn
                (goto-char (point-min))
                (replace-string (car c) (funcall (cdr c)) nil)))
          template-replacements-alists)
    (goto-char (point-max))
    (message "Generated."))
  (add-hook 'find-file-not-found-hooks 'auto-insert)

  ;; (if (null tabbar-mode)
  ;;     (tabbar-mode))
  ;; (global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)  ; 次のタブ
  ;; (global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-backward-tab) ; 前のタブ
  ;; (tabbar-mwheel-mode nil)               ;タブ上でマウスホイールを使わない
  ;; (setq tabbar-buffer-groups-function nil) ; グループを使わない
  ;; ;; 左側のボタンを消す
  ;; (dolist (btn '(tabbar-buffer-home-button
  ;;                tabbar-scroll-left-button
  ;;                tabbar-scroll-right-button))
  ;;   (set btn (cons (cons "" nil)
  ;;                  (cons "" nil))))
  ;; (defvar tabbar-displayed-buffers
  ;;   '(
  ;;     "*scratch*"
  ;;     ;; "*Messages*"
  ;;     "*Backtrace*"
  ;;     "*Colors*"
  ;;     "*Faces*"
  ;;     "*Apropos*"
  ;;     "*Customize*"
  ;;     "*shell*"
  ;;     ;; "*Help*"
  ;;     "*minimap/**scratch*"
  ;;     "GNU Emacs"
  ;;     )
  ;;   "*Regexps matches buffer names always included tabs.")
  ;; ;; 作業バッファの一部を非表示
  ;; (setq tabbar-buffer-list-function
  ;;       (lambda ()
  ;;         (let* ((hides (list ?\ ?\*))
  ;;                (re (regexp-opt tabbar-displayed-buffers))
  ;;                (cur-buf (current-buffer))
  ;;                (tabs (delq
  ;;                       nil
  ;;                       (mapcar
  ;;                        (lambda (buf)
  ;;                          (let ((name (buffer-name buf)))
  ;;                            (when (or (string-match re name)
  ;;                                      (not (memq (aref name 0) hides)))
  ;;                              buf)))
  ;;                        (buffer-list)))))
  ;;           (if (memq cur-buf tabs)
  ;;               tabs
  ;;             (cons cur-buf tabs)))))
  ;; (setq tabbar-separator '(0.2))      ;; タブ同士の間隔

  ;; git-gutter
  (global-git-gutter-mode)
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

  ;; howm
  ;; http://howm.sourceforge.jp/uu/
  (setq howm-prefix "\C-c,")
  (setq howm-menu-lang 'ja)
  (autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)
  (setq howm-keyword-case-fold-search t) ; <<< で大文字小文字を区別しない
  (setq howm-keyword-file "~/howm/.howm-keys") ;; デフォルトは ~/.howm-keys
  (setq howm-history-file "~/howm/.howm-keys")
  (setq howm-view-use-grep t)      ; 高速化される？ http://www.naney.org/diki/d/2014-03-17-howm-Markdown-Plack.html
  (setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.md")
  (global-set-key (concat howm-prefix "n") #'howm-create-nikki)

  ;; howm日記関連
  (setq howm-template
        #'(lambda (n buf)
            (interactive "p")
            (cond
             ((= 1 n)
              "= %title%cursor
%date %file
")
             ((= 2 n)
              (concat
               "= 日記" (format-time-string "%Y/%m/%d")
               "
%date
# 睡眠%cursor
# 朝食
# 昼食
# 夕食
# 天気
# 進捗
*

# 今日の単語
# 得点
*
 *
* 合計
 *
-
")))))

  (defun howm-current-date-lazy ()
    "6時前なら昨日の日付、それ以降なら今日の日付でemacs内部時間形式で返す(時分秒とか気にしない)"
    (let ((time (decode-time (current-time))))
      (when (< (nth 2 (decode-time (current-time)))
               6)            ;←6時
        (setf (nth 3 time) (- (nth 3 time) 1)))
      (apply #'encode-time time)))
  (defun howm-nikki-file-name ()
    (concat howm-directory (format-time-string "%Y/%m/")
            "diary-" (format-time-string howm-date-format (howm-current-date-lazy)) ".md"))
  (defun howm-create-nikki ()
    (interactive)
    (if (file-exists-p (howm-nikki-file-name))
        (progn (find-file (howm-nikki-file-name))
               (howm-set-mode))
      (progn
        (howm-create 2 nil)
        (set-visited-file-name (howm-nikki-file-name)))))

  ;; markdown
  (setq markdown-command "marked")

  ;; flycheck
  '(custom-set-variables '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))) ;jshint,jscsを使わないように

  ;; modelineに色を
  (set-face-attribute 'mode-line nil
                      :foreground "#fff"
                      :background "#009966"
                      :box nil)
  (set-face-attribute 'powerline-active1 nil
                      :foreground "#000"
                      :background "#00B666"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-active2 nil
                      :foreground "#000"
                      :background "#00FC66"
                      :inherit 'mode-line)
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#FFF"
                      :background "#004444"
                      :box nil)
  (set-face-attribute 'powerline-inactive1 nil
                      :foreground "#000"
                      :background "#00AAAA"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-inactive2 nil
                      :foreground "#000"
                      :background "#00FFFF"
                      :inherit 'mode-line)

  ;; twitter
  (setq twittering-icon-mode nil)
  (setq twittering-use-master-password t)
  (global-set-key (kbd "C-c t") 'twittering-update-status-interactive)

  ;; skk
  (if (file-readable-p "/usr/share/skk/SKK-JISYO.L.cdb")
      (setq skk-cdb-large-jisyo "/usr/share/skk/SKK-JISYO.L.cdb")
      )
  (if (file-exists-p "~/Dropbox/config/skk")
      ;; awful!
      (progn
        (setq skk-user-directory "~/Dropbox/config/skk") ;SKKの設定ファイル
        (setq skk-jisyo "~/Dropbox/config/skk/jisyo") ; が、読まれないが、こう設定するとjiysoは動く
        ;; (setq skk-large-jisyo "~/Dropbox/config/skk/SKK-JISYO.HUGE") ; causes freeze!
        (setq skk-jisyo-code 'utf-8)
        (setq skk-record "~/Dropbox/config/skk/record") ;しかし、recordとstudyは反映されない
        (setq skk-study "~/Dropbox/config/skk/study")    ;とりあえず追記しておく
        )
    )
  ;; (require 'skk-decor nil t)
  (defun skk-j-mode-activate ()
    (interactive)
    (cond (skk-j-mode
           (skk-toggle-kana nil))
          (t
           (skk-activate))))
  ;; Google IME SKK変換 (Buggyなので使わないことにする)
  ;; (if (file-executable-p "/usr/local/bin/google-ime-skk")
  ;;     (progn
  ;;       (setq skk-server-prog "/usr/local/bin/google-ime-skk")
  ;;       (setq skk-server-host "0.0.0.0")
  ;;       (setq skk-server-portnum 55100)
  ;;       ))
  (global-set-key (kbd "C-.") 'skk-j-mode-activate)
  (global-set-key (kbd "C-<henkan>") 'skk-j-mode-activate)
  (global-set-key (kbd "C-,") 'skk-latin-mode)
  (global-set-key (kbd "C-<muhenkan>") 'skk-latin-mode)

  (setq skk-cursor-hiragana-color "PaleGreen")
  (setq skk-cursor-katakana-color "HotPink1")
  (setq skk-egg-like-newline t)         ; ▼モードでEnterを押しても改行しない
  (setq skk-status-indicator 'minor-mode)
  (setq skk-status-indicator 'left)
  (setq skk-japanese-message-and-error t) ;日本語によるメッセージ、エラー表示
  (setq skk-version-codename-ja t)      ; 日本語によるバージョン表示
  (setq skk-use-color-cursor t)
  (setq skk-keep-record t)                ;統計を取る
  (setq skk-auto-save-timer
        (run-with-idle-timer 600 t 'skk-save-jisyo))

  ;; slack
  (cond ((file-readable-p "~/Dropbox/config/emacs-slack.el")
         (load "~/Dropbox/config/emacs-slack.el")))

  ;; wakatime
  ;; need to make symlink at Dropbox install
  (cond ((file-readable-p "~/.wakatime.cfg")
         (global-wakatime-mode)))


  ;; alert
  (setq alert-default-style 'notifications)

  ;; navi2ch
  (add-hook 'navi2ch-hook
            '(lambda ()
               (message "Hello")
               (start-process "2ch-proxy"
                              "2chproxy log"
                              (concat (getenv "HOME") "/src/github.com/yama-natuki/2chproxy.pl/2chproxy.pl"))
               (process-kill-without-query (get-process "2ch-proxy"))
               ))

  ;; google-translate
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "ja")
  (setq google-translate-translation-directions-alist
        '(("en" . "ja") ("ja" . "en")))
  ;; ================================
  ;; THE END of dotspacemacs/user-config
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
