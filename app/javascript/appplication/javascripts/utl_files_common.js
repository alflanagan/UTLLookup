/**
 * common -- functions used for multiple pages in utl_files app
 *
 * @copyright 2019 A Lloyd Flanagan
 * @author A. Lloyd Flanagan
 *
 */

import { $ } from 'jquery'

export class UTLFileTabs {
  constructor () {
    this.tab_ids = []
    this.panel_ids = []
    this.on_tab_click = this.onTabClick.bind(this)
    this.set_tab_ids = this.setTabIds.bind(this)
  }

  /**
   * On click of a tab, make the tab active and show its panel, while hiding others.
   *
   * Note the assumptions made about <var>tab_ids</var> and
   * <var>panel_ids</var>; they must be the same length, with the ID
   * of the panel for a tab at the same index as the tab ID.
   *
   * @param {Event} evt
   */
  onTabClick (evt) {
    for (let i = 0; i < this.tab_ids.length; i++) {
      if (this.tab_ids[i] === evt.target.id || this.tab_ids[i] === evt.tartget.parentNode.id) {
        $(this.panel_ids[i]).show()
        $(this.tab_ids[i]).addClass('active')
      } else {
        $(this.panel_ids[i]).hide()
        $(this.tab_ids[i]).removeClass('active')
      }
    } // for
  } // on_tab_click()

  setTabIds (tabIds, panelIds) {
    this.tab_ids = tabIds
    this.panel_ids = panelIds

    for (let tabId of this.tab_ids) {
      $(tabId).on('click', this.onTabClick)
    }
  } // set_tab_ids()
}

/**
 * @summary Convert package spec to a display name.
 *
 * @global
 *
 * @description Given a package spec JSON object, returns a string
 * which contains the same information, suitable for display but
 * easily converted back to the JSON representation. (see {@link
 * string_to_pkg})
 *
 * @param {Object} pkg Package specification (from python
 * <code>Package.to_dict()</code>)
 *
 * @returns {string} String with format
 * "<var>application</var>::<var>package</var>[*]", where the
 * presence of "*" indicates the package is certified
 *
 */
export function pkgToString (pkg) {
  let fullName = ''
  if (pkg.app !== 'global') {
    fullName = pkg.app + '::'
  }
  fullName += pkg.name
  if (pkg.is_certified === 'y') {
    fullName += '*'
  }
  return fullName
}

/**
 * @summary Convert a string with a package description to a
 * (partial) package specification
 *
 * @global
 *
 * @param {string} pkgStr The package string in format created by
 * <code>{@link pkg_to_string}()</code>.
 *
 * @returns {Object} Object with keys "app", "name", "is_certified"
 *
 */
export function stringToPkg (pkgStr) {
  let theApp = 'global'

  let thePkg = pkgStr

  let isCertified = 'n'
  if (pkgStr.includes('::')) {
    let parts = pkgStr.split('::')
    theApp = parts[0]
    thePkg = parts[1]
  }
  if (thePkg.endsWith('*')) {
    isCertified = 'y'
    thePkg = thePkg.substring(0, thePkg.length - 1)
  }
  return {
    'app': theApp,
    'name': thePkg,
    'is_certified': isCertified
  }
}

/**
 * @description Universal handling and reporting of jstree errors.
 *
 * @protected
 *
 * @param {Object} info Information about the error
 * @param {Object} info.data Extra data about the error
 * @param {string} info.error A code identifying the type of error?
 * @param {string} info.id The id of the element generating the error
 * @param {string} info.plugin The plugin where the error occurred.
 * @param {string} info.reason Human-readable error description.
 */
export function handleJstreeError (info) {
  console.error("ERROR signaled by jstree: error '" + info.error +
    "' occurred in element #" +
    info.id + ' (plugin ' + info.plugin + ' ): ' + info.reason)
  console.log('Extra data associated with the above error:')
  let parsed = JSON.parse(info.data)
  for (let key of parsed) {
    console.log('    ' + key + ': ' + parsed[key])
  }
}

export function getMacrosFor (domainname, globalSkin, appSkin, handler) {
  let parts = appSkin.split('::')

  let appName; let skinName

  if (parts.length === 2) {
    appName = parts[0]
    skinName = parts[1]
  } else {
    throw new Error("Name of app skin must be in form app::skin. Got '" + appSkin +
      "' instead.")
  }

  let apiCall = '/files/api/macros_for_site_with_skins/' + domainname +
    '/' + globalSkin + '/' + appName + '/' + skinName + '/'

  $.getJSON(apiCall)
    .done(
      data => {
        handler(data)
      })
    .fail(
      (jqXHR, textStatus, errorThrown) => {
        if (textStatus === 'error') {
          // don't report textStatus, it's useless
          console.log('Error is: ' + errorThrown)
        } else {
          console.log('status is ' + textStatus + ', error is ' + errorThrown)
        }
      })
}

export function getMacrorefsFor (domainname, globalSkin, appSkin, handler) {
  let parts = appSkin.split('::')

  let appName; let skinName

  if (parts.length === 2) {
    appName = parts[0]
    skinName = parts[1]
  } else {
    throw new Error("Name of app skin must be in form app::skin. Got '" + appSkin +
      "' instead.")
  }

  /* eslint-disable no-unreachable */
  throw new Error('this function not actually implemented yet!')

  let apiCall = '/files/api/macros_for_site_with_skins/' + domainname +
    '/' + globalSkin + '/' + appName + '/' + skinName + '/'

  $.getJSON(apiCall)
    .done(
      data => {
        handler(data)
      })
    .fail(
      (jqXHR, textStatus, errorThrown) => {
        if (textStatus === 'error') {
          // don't report textStatus, it's useless
          console.log('Error is: ' + errorThrown)
        } else {
          console.log('status is ' + textStatus + ', error is ' + errorThrown)
        }
      })
} // get_macros_refs_for()
/* eslint-enable no-unreachable */

/*
 * @classdesc An object that represents a bootstrap dropdown control
 * on the page.
 *
 * A bootstrap control is made up of a &lt;div&gt; containing a
 * &lt;button&gt; and an &lt;ul&gt; list. This object handles the
 * initial appearance, click handling, and updating the button text
 * with the value of the selected item.
 *
 * @constructor
 * @global
 *
 * @param {string} ul_id The id attribute of the &lt;ul&gt; element used
 * for dropdown
 * @param {string} label_id The id attribute of the &lt;button&gt;
 * element acting as a label/trigger
 * @param {string} label_text The text to show on the control when
 * no item is selected
 * @param {Function} select_handler Function called when a
 * drop-down item is selected. Gets this object as an argument
 *
 */
export class DropDownControl {
  constructor (ulId, labelId, labelText, selectHandler) {
    if (this === this.utl_files) {
      throw new Error('DropDownControl must be called with new keyword')
    }
    this.label_id = labelId
    this.ul_id = ulId
    this.label_text = labelText
    this.picked = false
    this.handler = selectHandler
    // console.log('Creating DropDownControl("' + ul_id + '", "' + label_id + "...")
    this.onclick = this.onclick.bind(this)
    // ensure existing list items have click handler
    $(ulId + ' li').on('click', this.onclick)
  }

  /**
   * @summary Event handler for click on list item.
   *
   * @description An event handler triggered when one of the
   * dropdown items is clicked. Sets label to text of selected
   * item, sets <var>picked</var> to <code>true</code>, then calls
   * user-supplied handler, if any. <em>This method is bound to this
   * object.</em>
   *
   * @param {Object} evt the Event object.
   *
   * @param {string} evt.target The list item that was clicked.
   */
  onclick (evt) {
    this.text(evt.target.textContent)
    this.picked = true
    this.handler(this)
  }

  /**
   * Get or set the label text.
   *
   * @param {string} arg Set the label text for this control to
   * the value of <var>arg</var> (plus a caret decoration). If
   * <var>arg</var> is <code>undefined</code>, the text is
   * unchanged (but still returned).
   *
   * @return {string} The text of the currently selected item
   */
  text (arg) {
    if (arg === undefined) {
      return $(this.label_id).prop('innerText')
    } else {
      this.label_text = arg
      $(this.label_id).html(this.label_text + '<span class="caret"></span>')
      return arg
    }
  }

  /*
   * Disable the control
   */
  disable () {
    $(this.label_id).attr('disabled', '')
  }

  /**
   * Enable the control
   */
  enable () {
    $(this.label_id).removeAttr('disabled')
  }

  /**
   * @summary Fills dropdown with string values
   *
   * @description clears the current list, then creates a list
    * item for each element in <var>data</var>. Clicking the
    * element will trigger this DropDownControl's
    * <code>onclick()</code> handler.
    *
    * If there are no items in <var>data</var>, disables the
    * control.
    *
    * If there is exactly 1 item in <var>data</var>,
    * automatically selects it (triggering click event).
    *
    * @param {Array} data A list of items to be added.
    */
  addLiFromData (data) {
    $(this.ul_id + ' li').detach()
    // don't prevent user from filling tree if no options or
    // just one
    this.picked = (data.length < 2)
    data.forEach(
      datum => {
        const newElem = $('<li>' + datum + '</li>')
        newElem.on('click', this.onclick)
        $(this.ul_id).append(newElem)
      })
    switch (data.length) {
      case 0:
        this.disable()
        break
      case 1:
        this.disable()
        // automatically select for user
        $(this.ul_id).children('li').click()
        break
      default:
        this.enable()
    }
  } // add_li_from_data

  /**
   * Resets dropdown to empty, disabled state
   *
   * @param {string} newLabel If present, text displayed on
   * button is changed to this value
   */
  reset (newLabel) {
    $(this.ul_id + ' li').detach()
    if (newLabel !== undefined) {
      this.label_text = newLabel
    }
    this.text(this.label_text)
    this.disable()
    this.picked = false
  }

  /**
   * Fill the drop-down with results of an API call.
   *
   * IMPORTANT: caller should reset control first
   *
   * @param {string} apiName The name of the API, such that the
   * first part of the URL is <code>"api/" + api_name</code>
   *
   * @param {...} urlArgs The data passed to the API, will be
   * appended to the end separated by "/"
   *
   */
  fillFromApi (apiName, ...urlArgs) {
    let apiCall = 'api/' + apiName + '/' + urlArgs.join('/')

    $.getJSON(apiCall)
      .done(
        data => {
          this.addLiFromData(data)
        })
      .fail(
        (jqXHR, textStatus, errorThrown) => {
          console.error('ERROR in api call to ' + apiCall)
          if (textStatus === 'error') {
            // don't report textStatus, it's useless
            console.log('Error is: ' + errorThrown)
          } else {
            console.log('status is ' + textStatus + ', error is ' + errorThrown)
          }
        })
  } // fill_from_api()
} // DropDownControl

/*
 * class to enable functionality once the user specifies a specific site,
 * global template, and skin
 */
export class SelectSiteSkinsForm {
  constructor (siteControl, globalControl, skinControl) {
    this.site_control = siteControl
    this.global_control = globalControl
    this.skin_control = skinControl
    this.all_picked_event = document.createEvent('Event')
    this.all_picked_event.initEvent('allPicked', true, true)

    this.site_control.handler = this.setControlsForSite.bind(this)

    this.skin_control.handler = this.global_control.handler = (evt) => {
      this.dispatchPickedEvent()
    }
  }

  /**
   * @summary Fill the secondary controls whenever a site is
   * selected.
   *
   * @private
   *
   * @description Gets site from site control, calls
   * <code>api/global_skins_for_site</code> to fill the global
   * skin control, then <code>api/app_skins_for_site</code> to
   * fill the skin control.
   *
   */
  setControlsForSite () {
    /* need different controls for certified pseudo-site */
    if (this.site_control.text() !== 'certified') {
      this.global_control.reset('Global Skin')
      this.global_control.fill_from_api('global_skins_for_site', this.site_control.text())
      this.skin_control.reset('App Skin')
      this.skin_control.fill_from_api('app_skins_for_site', this.site_control.text())
    } else {
      this.global_control.reset('N/A')
      this.skin_control.reset('N/A')
    }
  }

  // when user selects required values, send event to the search bar
  dispatchPickedEvent () {
    if (this.skin_control.picked && this.global_control.picked) {
      let searchBar = $('#search-bar').get()[0]
      searchBar.dispatchEvent(this.all_picked_event)
    }
  }
} // SelectSiteSkinsForm
