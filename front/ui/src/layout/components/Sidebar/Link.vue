<template>
  <component :is="type" v-bind="linkProps(to)">
    <slot />
  </component>
</template>

<script>
import { isExternal } from '@/utils/validate'

export default {
  props: {
    to: {
      type: [String, Object],
      required: true
    }
  },
  computed: {
    isExternal() {
      return isExternal(this.to)
    },
    type() {
      if (this.isExternal) {
        return 'a'
      }
      return 'router-link'
    },
    isNewPage(){
      return this.to === "/dataVenterprise"
    }
  },
  methods: {
    linkProps(to) {
      if (this.isExternal) {
        return {
          href: to,
          target: '_blank',
          rel: 'noopener'
        }
      }
      if(this.isNewPage){
        return {
          to: to.replace("/dataVenterprise","/enterprise"),
          target: '_blank'
        }
      }
      return {
        to: to
      }
    }
  }
}
</script>
