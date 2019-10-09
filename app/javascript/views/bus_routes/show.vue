<script>
  import CSRF from 'components/shared/csrf.vue';

  export default {
    components: {
      csrf: CSRF
    },
    props: {
      variants: Array
    },
    data: function() {
      return ({
        variant: {
          key: '',
          name: '',
        },
        rules: {

        }
      })
    }
  }
  </script>

  <template>
    <div>
      <div class="field is-grouped">
        variants.foreach() => {
          <p class="control">
            <a class="button is-link">
              variant.name
            </a>
          </p>
        }
      </div>
      <h2>Stops</h2>

    </div>
  </template>

  <style scoped>
  </style>