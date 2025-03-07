CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T101304        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.5</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?���-�C-?�@�
e1?�{��v�N?�f���L@�3�A��@�\��@|�<�4�@���@���@�NH�g@"�#�SO@%ˠd��@)�:���@,��!s[�@0E�K�2@1�?�0(@3�a1,�J@6��yR@8#}�^W8@:T�Ϥ@<�E�]@>��~��@@�)����@A��X�@C!����@Dj��@��@E���s@G����@Hr��H?�@Iؿn�@KE�m�U�@L�f��|@N3	��@O�i%���@P���t�@QcrO �*@R,�C��I@R�RA�27@SȰ?�y�@T�����@Upk��@VG�Jv[�@W"v���@W�����u@Xߓ?&i�@Y���>�@Z��,�*�@[�iY���@\xF��ٖ@]d���?�@^S��~@_C��V@`����@`�&M��@a�wwf�@a����)�@bu63d�@b�N0�C@c+2�j�@c��&�@d��h��@d������@e�C1�#        ?�<��JU?�F�8^�?��ʇ�?���ėRW@-�����@:��f@�u]@K@zN�Y=�@ ����K�@$�	�E�@(T*���@,]��XI�@0QG��5@2��N�R�@4�g�1@7[tGRm�@9��c��@<�@?A���� @A6$Az@By��\�@C�q��J@Ez����@G	W1�@H�����@JA^�ϕI@K�.����@M�'��oV@OT����@P�O'O$@QnS��!�@RU��p&�@SA&���@T/�� ˼@U!���h@V饺+@W��
�@XNs*Y@Y
BG�@Z�WE1@[�S�o�@\�����@]#H�<��@^0ԋ�$�@_A.y'ߔ@`*%n�\@`�oJ��@aALJ�z	@a���H�@b]��N��@b�Ҫ��F@c4���.@d�U�P @d��k���@e:�֖��@e��X�(d@fhJW���@g �"]��@g�e��?�@h5Es�r@h���CT�@im�K��@j�>�+�        ?Ė����P?�eh,�~�?�I�'9�e?�1�
�x�@�E��@�����^@��E��v@��y5@!b�!ޚ?@%}<}L@(�(��j�@-,�a�E@0��7�@3
��E��@5v.�7=@7��F�/@:��Mf��@=UO�2>i@@��ח@A���x�k@C�G?�,@D�x�8v@@F#�~�@G�W�Ý�@Ij�	sN_@KX%r5@L�Z�$@N�ń�?`@P6��q��@Q"�@R�uQ@S����@T h?[��@T����d@U��]�L@W��	@XR��{�@Y��s��@Z+�B%��@[@��0s�@\YuƯ��@]u����@^�!���x@_��\�@`p����4@a02{�@a�rB�s^@b6st���@b�/Yݢ�@cm�6C/m@d�vO�w@d���I�t@eL� ��@e�C��@f��A��@g;$��5�@g���B"@h��Z���@i7���(r@i�p�z��@j���4�q@kBwG��@k�Ĩ}��        ?�]3y��[?���{?����/@<?2��\@�JP��+@�P�@�u@#8+B��4@(��8GA�@.g&��U@2a �~,�@5ʩc��#@9l��eo@=D�;_D@@��pʓ4@B���J�@D�,�;��@GG#�[�@I��ܜ�,@L��ӸW@N�X��@P�)�͎@Q�s���w@Sa,Ri�@T�����@VA��Q�@W��p_�l@YE��w�@Z�3҇3�@\jѭ~�@^	b0�l�@_��^��@`��.���@a�~u�a�@bg���k@cI�Bd��@d/vu9�@e�7NY@f-%r@f�1=�@g敷VD�@hܨ*=@i��DL�@j�B�Xf�@kѫ�*(�@l����o@m�b���@n����@o�=�1U@p}!�0��@qR�I@q�� ���@r�l/��@r���[$4@s2��w0K@s�D���c@tP�f/�@t�:SH�@us���b�@v��_�@v�����@w0rIS�@w��nV-�@x^dE4*        ?��E��:?ٙ�҆�r?��- /�6?��Em�)+@L�V��O@B8��v@����@�t�}D@{�Ӧ��@���P@"B�ɚ@%K�:�^�@(�r����@+���@/k��lm6@1��9Kv@3w҅@Cf@5s�9���@7���Q@9������@;̭8U��@>
E#��"@@+��֫�@AYc���@B�rR�o�@Cʋ;3� @E��"��@FW,��E�@G�g�yd@H��|��@J[z�1�@K�&��9@M'Z�g@N�~{�xQ@P��".@P��)�@Q� �0@RE��-F�@SO�o�Y@S�^�e@T���-FS@Uk"�鴮@V:�֢�s@W�+��7@W�G`q��@X��~e@Y�J��@Zl����@[J��z�_@\*|��w@]�ؾ�@]����4�@^�r�Gu|@_� XJ(@`UN�#6x@`ˡρ��@aB�lvS@a�G�R �@b4�����@b�����@c*
OnΚ@c�+Կ��@d#5��"r        ?�q��y(?�;pv��?���=KjR?��&nc``@$�'Z�3@6D[e@�����@x��N�@! �q��.@$�g8�(@([#��@,i.K��@0Y�Oٷ?@2����Ug@4���լ�@7r��f@:�q��/@<��q��B@?qB2m�@A%v�F�.@B�z���)@D S(�$j@E��*OQi@GE/1�i6@H�@�?@J��$��@LE��T@Nv4�RW@O�Ϯ��4@P�i�{:@Q�(��&S@R����;@S�.�z�@T�Sd@U�Ｊ�R@V��(�C�@W�+�iU�@X�[�.xE@Y�/kW�:@Z����NL@[ō���.@\��bL�Y@]��S�)@_ ߞ'&@`ւ��@`�9y��@a<0̪<@aд&Y�@bf���q@b�?R�٧@c�6=o�@d1�|�]�@d�b�A�G@ej���[@f	�Q�f@f��a31u@gJ	]�;K@g�u����@h�%��O@i5P�g,@i�;��)v@j��K8%=@k+-�p86        ?Ĥ܁�#�?�_����?�?Ȏ��O?�v��J@���0��@�
݋��@�;}�j@�lX=�@!X߾�S�@$�=u��@(�6B�	�@-
�G�<@0�����@3 {>} @5ja�0n@7�M2;&@:���q�|@=D��e @@	�m��@A|-/nq@B����.�@D�7�Y@F�͋v@G�`FL #@IW��[�z@K�6��	@L���pw@N�t��
@P&�����@Q	��P@Q��EW��@R�]���@S���>��@T�~R̄�@U��[�ޱ@V����@W�cI]�c@X���	@Y�O��@[t7ʏ@\�|��@],�9��!@^E��b�.@_a����m@`@�� �@`�Ƀ��@ad~����@a��η�@b�_tRׯ@c%|�qQ�@c�.��@dW����@d�f=&@e���d�k@f-}w2��@f̔�|I�@gl됲�0@h�/�>@h�OD�a@iUTu�LA@i�����`@j��?i�@kHy� ��        ?ц�_IC?��+�n�?��Uy�Hl@
��^&!@�� ٶ&@�`}��@"`�c`�@'x��2�m@-`�؝@1��撹�@4��à��@8L�.d=	@;�W���@?�� ��@A��K�@D�t��@F5�lhN@Hx�;5��@J�/���@M8Ph��@O���j�@Q >���C@RoBQVZ�@SƚƂs�@U&�)�@V�o��	@W���[�v@Ys,A��I@Z�7ԓ�n@\v�����@^�����@_�`�R
2@`�T��~T@ah�crN�@b<�Q�tx@c���V�@c����@�@d�Eak��@e����x�@f���Ġ@guQ�G��@h^�����@iJ�1~�@j9V��3@k*�TPtG@l,��,@mC՘9@n����@o�UM��@pF�t�@p���Bg�@q��d/�@q�ʮ��{@r��xb@r�~�S� @s� �@s����E@t+�0���@t��� 3@u@�f��%@u��竚Q@vY�eY��@v���"        ?�<���
?���Mё�?�)��Vî?�##X��@�Hp�<�@�b�R�
@P�R�@@�]�A�T@��}9�@7ݬ��@"�ym�6@%�-
�Fu@(�5J���@,R{,���@/�)���@1�No��,@3Я4@5��o@7����d@:#���+p@<b�+?L@>������@@�v�h�i@A��C4�@C��Z�@DI���1@E�կ��P@F�t�)z@HMKK�|@I�7��@@K���'@L��5Y�@N
>��>@O�I����@P�h�W�X@QN��j��@Rgzi/@R� ��d@S����$�@T�Y@U\k/�v@V4��!�@Wp�G@W��h0�@X�Hu=V@Y�)�ϮV@Z��PՆ@[}��@�g@\h<��Q9@]UQ����@^D���@_6ㅆi�@`�nbȃ@`�	ߊL�@a��"|0@a�GG��@b
�/�@b��C
_@c
�[��@c�����@d"C��@d�'� @eA�.E        ?�.��8կ?�X��4�?��D�G9?��wp��@E'��P`@K��U��@����@���vf@!h�l@$���J�@(q:G�v|@,��л.@0d���j@2���3ͫ@5��]��@7wc>�@:�R��k@<��G�Y@?e"���4@A1��@B���F?�@D
쳆�}@E��2�֒@G!�!�@H���Lˬ@J];�އ@L2{���@M��׽�@Owv���@P����R�@Q��c�p@Rmh�E�@SZ���^Q@TL68p��@UAsov@V9f�1#�@W5/�A�6@X4M�d�@Y6�����@Z<&��F@[D�Ŋ9@\P6<�@]^�N�|�@^o�$A�@_� �]ӛ@`Mn�}��@`�9�»u@ahX���@a�Ƈ�9�@b�}��@cz�ء@c���;�@dB7���@d��禘9@en�!��+@f�bʧ@f�U�BI�@g:�Z%@�@g�gZQ�U@hs�~T�@i�ԋ�@i���qw@jO�	tn�        ?ćeXz��?�Q:���?�3R��x�?����&a@�b��@{�ZG@慿p�e@�u�BB�@!P��}��@$!Br@(�-xzK�@,���}�@0���.�@2�i�@5b ���@7�R���@:�Nu��@=:�\zrD@@��R*�@Awh�Ġ@B�'nr�@D}��.|y@FM��m�@G�
���C@IS��0��@Km�焮@L��l.��@N~�7x�@P$ǣ��&@Q�pa�h@Q�my�C@R�{%@m@S䕄���@Tާt�J@Uܛ��Y�@V�`Z/}@W����@X�!gy�@Y�ю�a@[
�0V�
@\�_���@]6���&@^P�o���@_oS?�^@`H:�Z7@`������@ao�3�E@b��3�@b�
�P�@c4��lJ@c�Ys�`�@dk@@�pn@e���@e��e��@fG�=)@f�};�@g��I�"K@h1 ���@h�Ǡ�N@i}�=�@j&FSZ�h@j���s� @kz�1?��        ?�USe9�?�H����?�}���Ԯ@
؜<�؟@Uŧ���@��|�f@"��lp9�@(;�HZ�@.��D[@2)cb营@5�O�o|@9%��$��@<��X\g@@}\�($@B���L��@D�@ �*@GI�Z��@Ir}!��h@K�����@Np����@P��"��@Q�ĸ�p@S@fg��@T�4�|�@V���g1@W�wɈ&�@Y ���-=@Z���\�B@\C�
zP@]�_&��@@_�O7�@`�:�|o�@at�t�=U@bS,�^@c5�"�g@d��3Ƚ@eΡ��@e�g��@f�a����@gӭ.B,@h�8�7d@i��>�d@j��'�g@k���i��@l�����@m�����@n����@o��4��@pwj|$�@q E��+@q�m�IX@r@���L@r�w��s@s2Ϧ��@s����Ȋ@tS2~2>�@t帟�g@uy�ml��@v�p���@v��=�F@w<:N\�@w�ڣ~+f@xn�_n
        ?�C��v֮?�'�u=�{?�X#wJ�?�oHߢ�@ ����O?@�^�\b@���~@!4�m�@�-2.9�@�l�LN@!ˊ8�V�@$�;`Y	�@'�M 4�@+qw- @.y��"�@1 �����@2���7pX@4��jN@6�l��@8��.{z�@:�jb�3�@<���J@?81�)@@������@A�f�*2@B�In@D"/�P��@EW�r���@F��T� @G�G�sA@IH�[��@Jd�ү��@K���}�)@M
n���@NdбhM(@O��>�@P��}�R2@QH/Z �@Q��2�>�@R�VѬ
[@Sr)��3�@T/��@T�n��]@U�$F�1�@Vr-�1Mq@W7.\se@W�4ȑ@X��N[&@Y����O}@Z]�F7�@[,+C���@[�N�Ǌ@\��r�o�@]��"?W@^v"�:@_L�j؞P@`�f�a@`��6��@`�E����@a[�@��@a�WN�@b;'|?@b�����        ?�!�W�?�5�x?����u}�?����l.�@�"���@,?CE@v�$��@`@_ @ ��QI/@$s�I���@(9Z}�P�@,<�����@0=A��g#@2wʹOs5@4̵�f\�@7:��#<@9���fK�@<^;�<>0@?�L	�@@�U�ٌ@B\P�!�@C�ݩ`0(@EWG�Y@F��ƺ @Hw�ѵ	@J����@K�� �@Mj��I"�@O!h�J��@Pp���@QS:R���@R:"���@S$��S��@T��)��@UL:MK�@U�7K�"@V�o@(5K@W�����@X넿܃�@Y�Ic�@Z�'��s�@[�t��0@]��Y2@^�̈́ ,@_#�%���@`��6�@`��AFv�@a3DW��@a���!�@bPBE��@b�i�`�@cq�c[�@d��?è@d�vv�x�@e-y�餛@eÝ��@fZ�Z%qD@f�/~xS@g���T�;@h'��.�@hv��@i_���^@i��2��        ?�5��'?���
�t?����p�5?�^�v��n@��(��@�7C�@g��Ue@Q�Vn�@ �*��@$n~� Q@(6?̩}�@,<?9I@0>V��5
@2z|�F�c@4�(��P�@7A%:͔�@9�Y2��'@<hǣx��@?�!Y�@@��V^@�@Bd�;�&@C���:��@EbKS��@F�Ac�8@H�����@J#'+�<K@K��pk@Mx�,��@O/�nJw@Pv���N�@QYA��L{@R?�_��@S)]Ѱ��@T����@U%�Nl�@U��D���@V�l]5$@W�.�-@X�rK�	�@Y�>^��@Z�MA��@[�<&�A�@\�W�z�@^G����@_���M�@`3r�0p@`�;K�/a@a)����K@a�&��@bC��?��@b�۔�b@ccQq�*�@c�Ǉ�R@d�ll(�@e<F��H@e�2!�/�@fFI&��@f�}r:�@gu���4p@h+����@h���|��@iEK �@i�G�R�        ?�7����?잢z��?����$�@	�� ��@T���h�@��̧�@!��8 �@&�3x��@,_��)�@1!���`@4Gr��@7��\��@;'�ؙ�@>ڒ�Z�2@A[���@C^��czp@Et��@G������@I��<)S@L�s6Re@Nx�����@Pq#*���@Q���Z�@R�Zx�b�@T<O��L@U�7�2��@V��F	��@XFƂ>@Y��ÄN@[`u��@\�"��h@^ ���*@_~
U� �@`�s׿�@aD��M�@b^��+@bԻs�:l@c���6�@dn�A�S}@e?��#@fɑV��@f�1�7@g��7�Z�@h���v�F@iu�����@jS�N,&�@k4I�S�i@l�:[@l���E��@m�T�Ҩ@nɕ�q@o����7�@pO�?cS@p��z-;(@q>��?��@q�Tsl"�@r0���@r�aX�A�@s&�����@s��d	�@t�f�?8@t����{3@u} �7�        ?�&):��?���F?�T�7p?�
�IY�,@q�v�}@w���&;@CVϏ7@ƿ`d�h@�s@[�@&i��[@"zΘ�X+@%��kL@(�bvI@,Qg
�P�@/�
ݢ��@1�7\߶�@3ט�x�@5�R�]-@8y�~�@:6��'��@<{n��u)@>љu���@@���vG@Aث�}�'@C[��^@Di����	@E��Źv@G2��@H~�<5@I�G>ܩ�@K[�:QO�@LՒM)Y@NVI���@O���/q`@P��g@Q���U@@RNf[��@Sox�U@S��� =@T��\N@U��C��@V�*E=-;@Wcȉ �@XGdx�I@Y-�t�@Zl��@[ŋ+3�@[����@\���Ga@]ٿ�Ҷ@^�D0�{�@_�}�?�#@`d1��7�@`��S}�Q@ae�߂@a�t��@bk#��@b���$�@cvR���p@c��p3�@d�z,q]�@ea"#�k@e�z���        ?���t�D?���tiA5?��)���?���X�@ �z}�@�S<�8|@Vl���I@�R��g*@!�U�p*H@%Yb0��@)PU�3�@-�_u˖y@1����@3]�v�@5��X�@8h��ΘC@;g�<-�@=߂>��@@`���@A�W*W�@Cd C�/�@D����n�@F�!v�.@H;�M 8�@I��>�@@K�pʓ[@Mn�/�y�@O=>]�@P�}u��i@Qz�R�C}@Ro���N�@Sh���y�@Te�+�@Uf�;A�Z@Vl4��b�@WuO���@X�7"}N@Y��F�c@Z�#{/�@[��Wu@\�v�-T7@]�do�a!@_�nP@@` �0Fy�@`�J��X�@aKym��@a�FK�@b|�Z�@c���H@c�O��@dR A�G@d�`>w$@e������@f5�5+@f��ń&�@g~D�/@h$�k�fl@h��?}@iv�����@j![�d�@j̈́�WH�@k{�r�m@l)�YH�        ?ğu}��,?�_�'pϛ?�?�!��6?��'���@����@�&RFL@�v��$�@��B��@!Np7p0@$���#�@(ȅ���?@,���f@0��ɾ�N@2���@5S�b��@7�pظ2�@:p��n�@=$���-}@?�:�w�@Aih_sŗ@B���Il�@Dl�	���@E�0�08�@G���\��@I>����@J�m���v@L�FkV@Nf��t@P�����@Q �z3@Q�˞�@R�h�\��@SԬ��+0@T�ӚU&�@U��`m��@V�qu �@WϺA&�$@X׏9�eE@Y��¿@Z��@\�����@]��j@^1fY�a<@_M��S@`5���@`��+�\�@aYf���@a�mX�B]@b����E�@c=x3@c����>@dL���@d��Z�@e���g_�@f"��9��@f�U~R�e@gc'�%�@hC�׮X@h����a�@iMFb6�Q@i���
�@j�+]|��@kBf��        ?Ҵ"�`�2?����
�@ >����@�@���@�*��!@m��E�@#���+]�@(��K�&�@.�����@2�����@6:~��D @9�r`goR@=䖎7@A�B�c�@C2�;��a@Ex��I�3@G� 9~��@JL:y��Z@L����U�@Oy��7l@Q.��@R}���%w@S����v�@Ug�!���@V�����|@Xw��1�u@Z�:�@[�G_T/@]S�m���@_�{�\@`^)��Ce@a>z3�@b"�)�!�@c �@c�ɂ�r@d�����@e�e2k�@fє%�ٽ@g�\��1@hʱx�7�@ĩ�J
�@j��s%�@k�l>���@l�h����@m��9e��@o0�Mf@p�B��`@p�^2��@q)Z5v�@q�����@rI����6@r�|@�5�@sp�8G@t���.@t���A�@u5���[@u�B��@vj���@w��m�@w����@xEu��j�@x�o�=J�@y��B�?        ?�.��:��?��/�'?�>Q�?z�?�ZH�3�@ �@v�(�@�^����@|㚝)c@�چx�@�7�:��@7^#7L@!���db@$�U�W"@'��c/0@+)�Ʈͭ@.���WZR@1K�$1t@2�8`�@4���/�}@6�Y*�5�@8�jB��@;�8�.�@=2pdl�	@?l�)x�@@�ӿ��@B'Q�&�@C8HG�:@Dq���@E�^��i�@F���dl@HA��-�q@I�|�a�@J���f @LI���@M�|�X@O��o}w@PB�-L��@P��B�n�@Q�U1
@Rx$=)��@S9��]�w@S���PiQ@T��B�7x@U�����X@VWv�=^@W$�]�:�@W���#0�@X�xO���@Y��Y13@ZnΨ�:P@[F�=5p�@\ h,u4�@\�<���[@]���Z@^��G��=@_�uOZ�@`?~�d�y@`�.P��@a%�$�@a�C�}�@b��y @b���o�s@b��T/9@ct�o��        ?��9�|?����|��?�A�g�?�ɪ��:@���*�@�45��@�s�3Q@�,����@ �ԓ�e�@#�l�gɰ@'�I����@+���ח@/��X��O@2��{@4V�L�z�@6�lQ��@91����@;� Ѵ/�@>hhG�@@�lkY�@A���-�c@Ci�>Z��@D� ><�{@Fg#�\�@G��F�'(@I��l�@K#�*
6@L�	>�@Nr��ؖ.@P���/�@P��]�E�@QИ�|@R���`Jj@S�Sg�@T�@�ǟ@UuuȃC�@Vf�J�0`@W[y��9&@XS#��Q�@YM��yn@ZKm�D-V@[K�� }@\OM�T�@]Uw#���@^^c���@_j
!��@`<1c�&@`ĳ�qt�@aN��J@a٧��ml@bf�g37@b�C��@c���\�t@d�	�n@d�&c~֣@e6�IB�@e�n���@f_N��W�@f�PTq�"@g�n���@h$��4L�@h���'�@iXX�Ӭ[        ?Ĉ��{Q?�H\Q;�1?�(�r�M�?���ܗ��@t�m:��@r:2�%}@���R!�@�:���h@!FK�8�@$��k��.@(�H�w4@,�	��@0���<K�@2�T��@5Q�;%@7�W �@:l��-��@= ��j@?ꕊ���@Ae�@/\@Bᎀn"w@Dg���>�@E�i� �7@G��
w@I7XR�U@J��[��@L������@N[��nd@P|�]�@P�W@Q�Ю�e@R�����9@S�-%Fz@T��$��@U�D���,@V�2�v@W����u@X�E����@Y�A^d�@Z�l�J�v@[鵍���@\��- @^a���}@_)�l#{Y@`"m*<�@`�sM�@aA����@aӺ���@bf��g+�@b���N@c��0��4@d(�e���@d���f�@e[�s�q�@e�5��4�@f���P�@g2
eO~�@g�f\۔@hrА��@i�f]3@i������@j[A�!��@k �^��y        ?�Ma�6�?�&J&Z%?�]����@	�k�g @m�S]�@>q�J@"�.��@'�ǖ��@,�RDH@1F��r9@4x~��hx@7�ҝ�$@;t!�+5@?8��|�@A�����i@C��7,@E�؈��@G�ȭ��@J?�ϻ�@L�Gp��@O׹{�[@P�RN=�@R�9�W�@SR��u@�@T�1�3י@VAS���@Wi�(�@X�a�.��@ZH)oQA@[��2q�y@]Bn��@^ɜ���@`+��!=@`�����N@a´8a�@b�Ŭ�;@ce�'��@d;�-�o@e"Xv�@e�b�*��@f�A���@g����s�@h��>{�[@ivJ�F@j]�[^s�@kH��@l4�UE?@m#LK~x�@nX�0�Q@o�6�i@o�/���@pzw�4 ,@p�n�'+@quyw�:�@q������@rt��+@r��af(1@sxO��@s�*�>�@tH[z�@u\��Op@u�d;�d�@vZ��^u        ?����g�9?�x?VK
�?�|�w?����y�@2��'�@T���U@
�<�l@r�\�@Q��;٭@��<�*@"#�-C?�@%)"���@(Z�as��@+����@/;e`P�!@1s<���|@3[>�<q@5T���MU@7_�&S��@9z����L@;��B��@=�yް�s@@�} �@A@ŖL��@Bs�t�8^@C�az�L�@D��ձ@F4��?�@G���zz@H�kt��@J/c�ʭ@K���@L���ͤ@N_Y
���@O�3|��'@P�Di�O�@Qa��VV@R!���A�@R䒳�e�@S����@Tr�X�@U<t�=�h@V	9HWN@V�T+���@W����K�@X}iٝ��@YSS̄u@Z+q�*�@[����B@[�71�L@\����1�@]��Ř��@^�AN�2@_i �B1M@`'ڴ�@`�)^Gh@ae*�x�@a����W@a����q�@bvp��S�@b�*�1�@ch�r��?@c�ov�        ?�dF%��2?�[{��?�Q�&��?�+�k��Q@�N�g&�@�J�o�@�-'�@.�{�@![b~�Q,@$���4�@(�2�qN�@-�IZ�N@0�30��@3
z�7�@5xRo��@8�9��@:�<�0��@=bXد�@@��@A����@C �1�@D���V�@F;	�<>�@G���S�9@I�,e�@KBP�`�@M�Ai@N�Nh��@PPO����@Q>g�n�@R0ц�@S'r�{F@T"0�xG@U �p�[Z@V#��"�@W*.����@X4x�"�-@YBm�O�@ZS��S��@[h�����@\�oL"@]�9�U�=@^�L�D#"@_ޓn��@`��`��#@a8L��@a����@bC"�Ê6@b�¼�K�@cu���'@d+�۝�@d��"f�@eK���9@e�-̪D@f�����@g-zu�ֻ@g�s��)�@ht�Jo%@i�*Q��@i�i��N�@jh�/�\@k�6��@k�z�ǰ        ?Ĝr!�1`?�_9��W?�AN�R>?�#{*Ь�@��ȭ�K@�neD�@��#m�@'�ݿ�@!b?���@%\;F��@(��C� �@-y�j@0��O%�#@36�uc�@5~��B�%@8�
��@:�[�;��@=e�z�8@@�~c��@A��Z��@C����@D��٠�@F2(^:W@G�s�J�@Izs4D�@K,༶�0@L�x�_/�@N��ԛ(@P=��'@Q'�Q{E@R�
#��@S	���kS@T |퓲�@T�OZv@U�t��T�@V�~
:�@X!���@Y
L�^]8@Z��Q�8@[&�t�C@\:4��#�@]P�v�\�@^ja��~@_� �y7@`Sr_�B@`��}�@aw�x�&\@b�[㿘@b�j	0�q@c8X�_@cЙ��W@dj'2���@e���X�@e��"��@f>cu�z�@f��?�^�@g|��@h�)��f@h���X@icy�0�W@j�Iڎ@j��u�3�@kT�ρ�        ?��hӠ?�"�v���?��j|��@
헼j�A@e���c�@��ȏ��@#-�G�@(Kŵ\}�@.?/���@22��~Ѭ@5���ES�@9-A��_@<����S�@@~Ju�@B���zu�@D�-ex@Gi�+��@Ie�n ��@K�@�Ժ-@NVKTu�@Pu��4`@Q�0�T�z@S%��@�@T���@U���)�@Wm���/�@X�46�@ZpE���p@[����+@]����F@_,`S��@`g]���T@a< &P@b�76�@b�[
l�@c��Ջ9V@d��Ƴs�@e��x�b�@f|��U��@gg�xuc@hU�����@iF\�К�@j:
�2S�@k0���N@l)�,���@m%�4��@n$>B)�a@o%r��-@p��[r�@p�� ¿@q2*��.@q��ߗ�@r(��n��@r��M�.r@s9�)~v�@s�/R�	�@tO����@t�H�6@ui����@u��L4��@v�p��Fj@wڝ"(@w�2R��        ?���V��?ڂp����?�ȯM(�?���T�a@�\{�8 @	-
�q�@�ʪ��t@i�>x�@��I4�@ �r�j�@#�X%l@&Wz� @)Ơ�@-g|X���@0�:a��6@2�
�M�@4���~ݚ@6����@9!1B5ۦ@;x[����@=�U���@@2	Շ�[@A{�1RP@B�|Ũ�@@D,��?o@E��l�=@Gǎ�]�@H{�;W@I�J��)x@K�վ\2@M��_@N����r@P-���!N@Q�-׾@Q�~��C�@R�T�� @S��K�K�@T�t��c�@UqbqQ@V_�g��@WQ�޴:@XH��B@YA�@O�@Z?��S��@[@�?�w0@\E�Mp��@]N����@^Z��@_i���.r@`>> �C@`�u����@aVc���@a���@buO�T)@cA)`@c�Գ@,@d0�S��@d��^�@e_0B���@e�!r*��@f���'Q�@g1����n@g�;~D�O        ?�F���>E?�A�|��?�T����@ 6����@�i9-@.�<e$�@�t&�x@"��s�$@"
��@��@%�b\Y]�@)�j�3��@.1���@1b�� ~�@3�	����@6S����@8����1N@;�6�+�@>�t���@@�]΅�5@BK�`57@C��2@E~xt�:@G)Z�JG+@H�p�^�p@J�i;�#_@Lk���۸@NA͢�r�@P�\��@Q��HL�@Q�m��@�@R��j�1@T �C��@Ud[�:@VVa���@W$��d�@X9#8�~{@YQ���[@Zn��h^+@[��Ԏ��@\�y�ZR^@]�[���@_
.-�P@`uD���@`�Ÿ��k@aTҙ#�@a�.(A�#@b�<ʤi�@c4,�N5@c��D�r�@d}�GAz�@e%瞶�@e�^F�<�@fyoX��@g&C�1U�@g���]�L@h��z�@i7O�F�@i����@j��" O%@kV���Y@l_:�@l�L���@m��6�~�        ?�pUwϧ?�3{_�?�A��FV?��R@@U7T��@\�H.��@��A���@��b���@!4m�g�g@$�=U=<@(�u�G@,ђ-�X5@0�4���@2�8�A@5R���f�@7�,W��@:z2�q��@=4ƕlMn@@%6S�@Ay��d�Z@B��l��U@D�]� ��@F�5��@G���8*@Im�A`M�@K$i�:�T@L�-��Q�@N��\PS@PA��^�@Q0�mۡ@R$/sPr@S=R�<'@T�mY�@U�[�8�@V^ߘ@W)*�RZ�@X77����@YIm9��@Z_�Oh�@[z ?�/�@\�8dYz@]�N5��@^�2?�S�@`�)8��@`��Q�:i@a4v?+@a�j 3@bj�һS@ci�2�@c�$'@dIj=ʥ�@d�<AB@e�E�?�@f7�~�K@f����\�@g�����@h4��ܒ@h�ȸ���@i�>G�Y@j@;�Փ�@j�-�;@k��Wo�X@lY=�8[�        ?�D���j�?�f�hQ?��A��^@:�z�@�`�ۅ@	ض:@#V�M���@(��R;;@.���\K@2�.w�@6*�E?�3@9�Z݇z�@=��ݟ�@A�/0Y�@CR���e@E�l!�l@H�CP#@J��	&@MJ�l��@P<X`�@Qo5ɕ��@R��:@Th����@U��!/P�@W���/�@Y4zm��^@Z��M1.�@\�ܤ��@^b}��a@`�e��@ai	�3�@a�W2��@b��E;U�@c�~{ڧ�@d��-X@e�a^�,8@f�y	L�{@h><��@i��>q@j3�$�/�@kPY�|c@lp��:LD@m�W�ǽ@n��u�@o��
؈@p�%?�L�@q+]҇cB@qȪ���@rh
�g@s	j��_@s�؟��W@tRJк��@t���7@u�,���@vN�H�8�@v������@w�.k��@x\[-�K@ylJje@y�\�3#�@z{( �F@{3�mL�=@{�<D��@        ?��34�=?٦B��|?����	a�?��bű@^JX�@a2S���@7��
��@�htϡ�@���^�@$$���@"}q����@%���j9@(�mv_@,g��tM�@0	/�� @1�'r�b	@3�/����@6�?c�@81���0@:l���y@<���=��@?�����@@��� @B
�PW@CU��Q�@D���i@F�fF�@Gj=D�@Hֳhhi^@JKiD�S@K�OiI��@MK/|��X@N֗n��6@P4�5=�3@Q�2*@Q�W�-@R�u�b��@S~���`@TYc���@U7Ug�%@V�]]o�@V��&߈@W��ā@X���w@Y�n�{p�@Z��g[�@[�*4H�@\�1ы]@]�����b@^��ۀK@_���w7@`KI~;�,@`���%Z@aR!�1�P@a׏�ȸv@b^M�$@b�We�S@co���}G@c�=����@d���|�@e!>��*@e�h��L�@f0�*��T        ?�F&v��?�tw<�?�9����?��[*kv@t)�@�@n�\���@ӸwѺ�@�U/��	@!@�F�@$����X@(�~xz�@,�L�|[�@0�UϺPJ@2��XKq@5U>��-@7���
@:x����@=0b��:@@ �e4@As��k�@@B�)$�|@D{��0�@F��<l@G��6�	S@IU���s�@KM���@L�Q]؏%@N�t��1�@P)�z�h@Q�4AF@R����@R��T��@S���6{@T��2Z@U�'Q#�@V����@W�ZL��@X��>$M@Z	�5@[f8G�@\0t�0Wq@]H�9c͍@^d�=J@_�L�{��@`S����@`�:�@a{%g߄�@bd��1@b�7���@cB��>�@c�J�@dy�Kq(@e�ﳅ�@e�'1w�@fW���_�@f�4��� @g�����@hB����@h�\�^C�@i���@j:1?���@j����@k�$VH/q        ?�dHn+��?�:���?�
�H�?���ނљ@c�ܳ��@e	��DH@Ƶ���@ˀ��B@!4}���9@$��@�H�@(��I�>@,�.��A�@0�����@2�f����@54)��@7��ƛC�@:E�|Q<@<�x+s@?�����@AHAf��'@B����@DA��@E�A���+@G`�%C�\@H�����@J�%Y�@LTF�\QL@N��M�'@O�-�B71@P�7z��@Q��a�~c@R��r�W<@S�T�̒�@T|v�kC0@Ur$l��@Vj朒A�@WgC�֥@Xfv'/S^@Yi
�e
�@Zn����@[w���5@\�r)rq@]�MV�^u@^�!>�a@_��J��@`hJ��y,@`��i5Ǟ@a�@H��@bU]���@b��88��@c8�V���@c��&8�@dbVS�ZL@d�7|��@e�nr�@f*�A1��@f��zA؝@gb ��g@g�w��Y@h�6e�L�@i>8��@i�x����@j��-�n        ?����1�?퍤0�w?�  �P�@
s7���q@�NRf@*����S@"��)��]@'���s�b@-�A���@2��Bq@5e��@�@9�P�1@<�v�ќ@@pg���@B�w��s�@Dǁ=&�P@G�`�޻@IHP���@K������@N��B�tv@P��']�*@Q�vLlu3@Sg>��DS@T��i,@VX�ĭ��@W�'�d��@Yp�^G�$@[`{=g@\�<wŴ=@^Z\��G@`����@`�c��@a�\W��*@b�w�S��@c��H{�@d�l��@e}�N�XW@ft�HNe@go[����@hm��U@io�$[{@ju{l,�@k~�@�@l�r�->@m����CR@n�1dR|@o�?�S6@pp�{Yr@p�͋ʸ�@q�Þu�@r �'vF�@r�Drz��@sI$�\k@s߁�`��@twU���-@u�Z[RN@u�N����@vGkM�p/@v��tp@w��1S�P@x$g�Ճ@xŚv
\@yh�D��k        ?����V�?ق���bz?���^B?��Iq)OD@;�%��@*l�~�A@"�	j@�]p�t@d!5���@�hu*'�@"2zZ\�@%;(��9�@(p��*��@+єW���@/[|��@1��0�9@3rlu5�@5p�-O��@7���w@9���%��@;�xVd@>�C���@@5PEd�6@Afv]Jh@B�/`��n@C�J�1@E&�9�,@Ft���r@G�#�s,v@I&�Wi�@J�����@K����l@M`����@N֙G]n�@P).>q@�@P��&��@Q��s.3@Rt�_{��@S>~�Z۫@T
�vl@T�d�9�(@U�����6@V�T��9@WX���ie@X2�(�@Y�)�"n@Y�0�@Z�DMַ@[�G{4�@\��B�=�@]�k֞�q@^n$�@_[��j�@`%È�D�@`��A(��@a��<�@a���}G@b''���@b�s<��9@c���@c�,��e�@d��j�@d��'�,�        ?�Q@o�ɾ?�u=pU?�8͔�(?���uJ��@m�2RD�@hoӄ�v@���i}@���@!1�D�@$�鰴�@(��u�x@,���~R�@0�Ϥd@2�H��@5'#��5@7��&���@:3��/A@<��Kհ�@?��0�@A:�T�@B�'�3�@D1�#��e@E��˼8@GO��Zܛ@H�h+ɰ�@J�	7��g@LC�{8H@M��C�M@O��*$��@P���Cc�@Q�R�@R��=�@S�t�qv�@T|�}�Y8@Ut~G�@Vo��@�@Wn��ڿ�@XqE�N�@Yw�G�H@Z�*�6�@[�m	\@\��d<M�@]���By@^�o����@_�2� �@`|rd���@a���4^@a�ec�@b.j��6@b���e@cV_qM@c�>�KW�@d�Y)��@e�ra@e�-�
[F@fO��lX4@f�����@g��Za�\@h&̊"�@h��bW�@ifV�eT@j���L@j�=�H��        ?� sW�?��z��J�?��QKD�?�O3�N	0@�yi@��%�@Xj�ʶ@=DŅ@ �L����@$]���i�@("e*�5V@,$���?@01M�raQ@2l:�S,@4� w���@71z��~@9��w�6@<Y}Q�@??
�@@��:9�@B_���/B@C�H���@E`n2��8@F�,�?/@H�Ð�@J)�`;�n@K�p[<��@M���?��@OC�*��@P����@Qi�Wq�@RT���@SA�jsم@T3�F�6@U)>>2��@V"h����@W/P-9�@X��Y�I@Y#U�b�@Z*�EHq@[5*�4�@\Cb��@]T6��@^h��X#=@_�8�F�@`MF��4@`�E�s�@alb�YU�@a�2��_o@b����U�@c&J���U@c��c13�@dTF26u�@d�sHDJ@e���tO@f$!ؽ��@f����@g`�y;�@h �51e�@h��رJ�@iE�H� @i���C�@j��#�
,        ?Ѹ�D2?�p�Z|�?�ڶ�TdY@
M��IH�@�Zw��@�
Ts(@"�P�2��@'��*^c@-g7��d'@1�+$Q�@5��b@8���2_�@<R|W�"@@�A�T@B+��iy�@DO����^@F�}͈2-@Hدğ�S@K<k����@M�P�@P}[?��@Qn[�#P@R�`�:1@T'M���@U��G�%R@W��m��@X}Exgԭ@Y��-�c�@[�߶#��@]�bv�@^�;r~@`+�� �@`��lGd@a֞����@b��\G�p@c�+ٗ�@dr��=@eW5�5f@f?�f��@g+J��Ta@hw9De@i��C�@j �kGf0@j��Vo��@k���@l�G��f_@m�C���@n��?@+Q@o���l@p��$	��@qc���@q�P"��8@r�P�a@r���j�q@s*�B�q@s��ʭ@tC�m(",@t�D�Z.�@ua����Q@u��S�@v����0S@w���e�@w���R��        ?���L�)�?پDS���?������V?�����(�@h����@j�Q"@:Z��[@��~/�0@��R��@j�N/6@"mH�@%��F]�@(���X�@,7l�	�@/Ҩ�%��@1�{(O�#@3�ry��<@5ʕʝf�@7�S�L�	@:'ȱ]~@<S���@>�(CC@@������@A�|���F@B�1�&@DD���`5@E��sB�@F���O@HJ�Đ@I�����@K(4`��@L��݈Mc@N
����@O�\�48@P�6?3
�@QO�ɀ\�@R�N$	�@R�z��9:@S�M�s��@T��a�"@U^�ţ־@V7u{�A�@W��uP5@W�;���/@X�D��@Y��20-o@Z�^��+@[�UZ3'n@\p�n�@]^�H��d@^OM����@_B/��q;@`�&pNE@`�����@a}�W�@a���,_@b�s��@b�4�'��@c�E�}�@c�:@$z�@d�����@d���N��@e$i�q�        ?�_K�I�?ሐ�Cv�?�PC���?�+=� �@��2Β�@��*��@��l�|�@�^�W@!\�uD�g@$�x��{@(���ؔ�@-	k-�j@0���߀@3w���@5|�Dh@8CS�s�@:��)���@=h��!��@@��1(�@A��5��@Cvb=.�@D��f�@F?g�M�@G��"M�@I��i9B@KE�s�e@M�K0q�@Nς��A"@PQ�W�(@Q>�5�(9@R1 ە�j@S'S~��@T!ƒ�&@U C�|�&@V"���g�@W)
S�@X3)��@YAX��@ZR���T@[g�c˞�@\�L�<��@]�ژ��@^�1�p��@_�WGa]@`���B9@a�ݠ@a��X�!@bF���H@b��IB@c|5 �$%@dR&I�@d��ߖ9@eXI$�+�@e�5�!@f�y�>��@gB_Ԕ�H@g����/@h���kA�@i:(F�,0@i�E��@j�m�)�d@k?:��A�@k�s�@W        ?�CQL�X{?���V&?��!��U�?��>@9� �rJ@F�Ip��@�>�I�V@��b~J�@!+`��@$�[nu{@(m�2B�(@,{0�@0aҎ���@2��)��#@4��
��@7q'	(@9��U���@<�H^(t@?[߂���@A��3��@B�`���/@D�@�:1@E�+�s�@G��6|@H��u���@JUo��x$@K����8@M�_T��	@Om*���@P���{N@Q}
zf��@Re�����@SR�讀4@TB����@U6�ɢ�@V-�`IL�@W(��9�$@X&ڐ�@Y(m'��@Z-T���@[5�H�y�@\@���@]O�U��@^a\N�A@_v=*!��@`Gǘu�@`Ԑ��.4@ac���@a��uG@b��o��P@c7	#��@c�����@dD^��f@dە�ݍ�@etht��@f�v
�W@f����$@gF���i%@g�ǈz@h��
|k�@i#�u�)Y@iņxGi@jh<�U��        ?������?�5�!?�
@�Gm$@
x1:q��@ڲf8@$;#8=�@"��;M�\@'�,4b@-���؄�@1����@5B�5�d�@8����4@<�;-�@@G�u�@B\����j@D��ø@F�.��@I%`���@K����h@N:Yc<@PW^�$��@Q���0$s@S.�(�@Tt����F@U�o�v<�@WaW�4@X�<����@Zo���S�@\��U�@]��Ø�L@_C��<16@`w����C@aQ]���@b.�/[@c�-@c�f.�Z�@d܊�n��@e�&�<�@f�.���@g����-@h�O9�%@i�O�MR�@j��Q:@k��hi�@l����e}@m�'���@n��C��@o�tob@p_����@p�5s��@qrPe�b�@q�˩g
�@r����:�@s�&q�@s�<y�$@t8�R@$�@t���hK�@u^B�yʵ@u��̡-@v�{���V@wj��h#@w����zM@xPߖ��        ?��J���?���l�I?�A�nҗ?�;Y�#@��gۄ@�|�@Q!�~x@��h���@���蹯@A= �K@"�M~j�|@%�E�6l@(��0�@,e����F@0c%��@1���@3�cP�?�@5�a@ܬ@8�kI�@:<^��@<~OMn�@>�D�\`I@@�h�!�)@A�G��`�@C��]�@D_��c�r@E����s�@G	4H#�@Hh�l_��@Iϼ [�@K=tU�@L��L���@N-":P�>@O����r�@P�����W@Qbĺ�C�@R-&�m�@R��3�N\@S�&D��d@T�����@Uu@�9O�@VNŞ���@W+:���@X
���W@X���r�P@Y�ɖI�v@Z���K�+@[�	��,@\�:e�p@]�[�g@^s��iF@_h�j��o@`0KP�p�@`�|��H�@a+�g�Of@a��{|Y�@b,���@b��-�*@c2z҆f@c�2�q;@d=!9_�@d�A����@eL����        ?�1ӫ� ?�`IjC��?�$�C&�K?���i�)*@ZG�4�@\�5�@�ο��E@����@!-q�ߕ�@$��[�a�@(�s���q@,�~��J�@0��/��
@2�7}b�@57meIQ@7�W��@:Pۘӳu@=��Pv@?��Jkw8@AV��69@B�?�$T@DXt��I�@E����@G�߿�$�@I(�iS2n@Jֺ�f��@L�J�h(@NN�a��I@PCck�@P�i�ˊ@Q��i���@RԀ�<��@S�P!��A@T�3C�_}@U�jB3+@V��MR
@WɎ���@X��N��T@Y��}Ճ@Z��E��@\#}9�@]��r6@^8!�iS@_V��xi�@`<T�F@`��.D�@ac-����@a�G��@b�uj�
M@c)v���@c�h�s�@d`'xI�@d���EG6@e����y[@f= T�5?@f�ȏ��B@g��DԊ@h&T+B=m@h���@ir��m��@j��	@j�i3h�c@kn�ܒ�T        ?���f0�?ᆐ���T?�ls��x?�mY�.(@�����/@��a�&@)�t�B@K�����@!�����@%-Y#OO@)�M@-JJtS@0�����@30#�c@5�r�p�@8+�g%��@:��P`F@=�*���@@2��7��@A� ����@C*�����@D����\@FM7�yU@G��P7��@I���>+�@KK�b�w�@MY� ^�@N����@PN+����@Q9����@R)�F;�@S�,�YD@TB�Oq@U��J�{@V�P9�@WȘ�R�@XYͦOr@Y"�f�c@Z0&z��@[A9��8@\U��m��@]mZǟ@^�G�=�q@_�a�y�@`cͅ�@`����o2@a��.f@b�R�8@b��U��%@cM�;w�"@c�k��:�@d��|&��@e#���@e�,qu�y@f\�-�@f���ٿ@g�މ8B:@hC�)b�@h�	��@i�C�_�@j7'�H@j�f�1u@k������        ?��ķ
�?�! K�?�X6�m�@
vf��@,@KzR��@$ЅUXu@"� ���r@'�\
�P@-�@BYxH@1����X�@5HM���@8�;��9�@<�ѡS;�@@L�^���@Bb
�#@D��F��@F��
T�@I+<���@K��."v4@NH�z'@PY{�`m@Q��9w|@S �]t�@Tt�rsKa@U�rR�Ҹ@W_��vs@X�3��k�@Zk�s��@[����k@]�qg�/k@_<��uS@`s8�MD�@aL& LG�@b(¤ǂi@c�z�@c�Ȱyw@d�޽�4@e�Ά�X@f��X�=�@g�nvr��@h�?"6��@i�X��+�@j���H�B@k�FAO�@l�4@�g@m��k�W@n��w�A�@o�ت��@pVpŧ$@p���3^l@qh�fU�@q�g�k@r�T1Tx�@s�毮.@s�}'T�@t0����@t�J���@uWD6���@u���/@v�J�p�@wP�('�@w����@xOP�	��        ?�cK/\��?�_�ĺO?�7�.�\?�,틘�-@�˲)�@�?�j�@R�)�3@��XUx�@���J{@1�0��@"}'�)p@%�#��z@(��O�x�@,C>K���@/ےW?�e@1�����@3��z�	@5�'�&�@7�q��{g@:
i��Z�@<El����@>��S�1@@v[��_�@A�7���@B�Z�%u@D.�g7=@Ez���@F���z;@H&���{@I�voN��@J�����@L\�	�w@M��j�c@OI����@Pd�L!�K@Q'����G@Q�m��~@R���i�9@S�/,�n�@TOлe�@U�E�3�@U�~�ĕ�@V���X@W��k�p�@XzP+l�@YV�4(e|@Z5|���@[�!v�Z@[��-��X@\�P�/�@]�����@^��2�'�@_�B�ս@`E�t�@`��z|�@a5�Mj�-@a��O�Y@b*{v�d@b�H�E��@c#
b�I@c��*=�@d_e͘�@d�����        ?����/W�?���s��?����?��BN@Z�@ 2%��b@飿6ݞ@y���ǟ@�HDgB@!�MpB�@%�����@)�E�b	o@-ӊf�@1/L��ݷ@3�IY��@6nz��V@8����y�@;swp��@>J3��@@�aJ?P@B" �`@C���5y@EOV����@F�	U
��@H�����@Jf���H�@L.�����@N c�h?@O�Xpc@PँS�k@Q��i��,@R��{s1@S�H����@T�5*��@U�I��� @V�)x�U@XR��?@Y���v@Z0�l�h�@[N���h�@\p3����@]���r�@^�.�7pZ@_�`�B�@`��',�>@a(�t4&w@a��eO@bc��F@c���~@c�%�K@dG.!�U@d������@e�f���`@f:}_�wv@f�4!7'@g���Q��@h<t��{�@h���^��@i�0�O�@jL�� �:@j��sv"�@k��c��@ljӇ��@m"�kC�_        ?�[�b�%?�&ZQ��?���o��?�xJ�~J�@i��M}@$��9W@m9���@@T5�B'�@ �ch�@$j�G�7@(-T�A�X@,-���$b@03��y�<@2k���!�@4� �a_@7(�d���@9�]e� @<DO�L�@>�����@@�	ץ+@BF�����@C�ƙȅF@E:&�ۀ�@F�c�X$c@HQ&���F@I�z�2�@K���2�c@M0���@N�i�T{�@PJ��YF@Q):���O@R�i�@R�A�נ�@S؜�0�K@T�t�h@U��w�?@V�4�_@W��l>�@X��"�jW@Y�ķ�A)@Z���J�@[��c��K@\����P�@]�|���@^��[�XW@_��N�w�@`Td�ECR@`�tD+9n@ac�a6�@a��I�S@bwS�v @c�21&I@c�Qj��"@d�>I�k@d�x�]ȯ@e;Q���@e˥3^��@f]5	��*@f�L�D@g�6��@h�����@h���L�@iCa���        ?�N4��SB?�K���)?��'Ðۏ@IB� t@sw5-��@��w�@#�s7��@(S`��i@.�!=��@24��D$�@5�hC	�@9-�C��@<�.LF�@@}���P@B�w�M@D�}=TO@G	�p>��@Id>;��@K�s �@NV�"�@Pv�Avn�@Q�7g0@S(����@T��j��E@U��2��@WvV|@X��Uȗ}@Z}86Ƃ�@\o�ø@]�1Y7��@_AR���@`sU,g7~@aI�VI	@b#1�DWd@c ;���5@c��㆚@d���w@e���La@f�x�_��@g���׀@hp���(@ib���z�@jX��@kO��@lJ+�^OV@mGv��H@nF��[@oH��]e@p&o
]�@p��j�@q.]6�>�@q��] k@r:�7M��@r�ꮌ��@sL$(�1@s�1��qO@tau��t@t��[eR@u{2�&KR@v	�Mw�@v�'
Od�@w)�㨳�@w�;��8�        ?�$#��4?�o�h�?�0g�yg�?�N �1_@ ��i��@�dՔ$d@h�\��@	����~@�7���@�ʨ<�-@!�f�,�@$�@��@'���b3�@+k� �!@.i�x;@0�?)��@2����@4��I�xx@6�����@8�:O�7@:�8�3~]@<�!��m
@?)�yA+@@��ռ@A�g▶�@C{󯃊@DC6n�\
@Es�ޥX@F��Q�@H
����@IY�ݒ��@J��U�C�@L	.���@Mip��@N�6L=@P1t��@P�m���@Q�A�Ӭ�@RM�D:@S�@S�Њ�0N@T�����,@U[�獯@V$���@V��h:�@W�y���@X����@Y`�*i@Z5/��2�@[��c)w@[�S�X:4@\���$�@]��O��@^z�O���@_[`$��@`��:y@`�s���@a�2�[C@ayI�fd@a�Kw g@bdqM�8�@bۀG5'@cSuG��        ?Č]r�ƾ?���g Q7?���f�?��Y�v�@������@������@����@���@ �>�}�@$M-��k@'��k%Ş@+�h5G��@/�Z1�%_@2�JHi�@4_ɪ�A@6�x���@9:����@;�ㅅת@>p�H��@@��,�@A���8��@Co%V��+@D�3��@Fn~{��S@G���-g�@I���etb@K0t���@L��Q�!@N����=�@P��Y^@P�*8��(@Q���+�e@R�g�Q�@S�WK|@T���,n�@U�l��N�@V�l�6$�@Wy�Ͳt@Xs�q�x@Yqp;���@Zq�\ܘ@[u^��B�@\{��mr@]����SD@^�����@_�����@`X�@��@`⟖�@am��W�@a����g@b�K�x�@cG��3�@c�oSi��@d8��c:�@d�'F�w�@e^�e�A@e�A��@f���2��@g�����@g�K�!%�@hP^r9@h��LN��@i��d,�        ?�e1>�!?��
ث�/?�Ƽ߸z�?�M���= @�0�X��@J0���@R�/�@2��<�@ �*Gp}�@$Q�W6�\@(���@,� 1�@0!m��e�@2W���L@4��Ǯ��@7[[.@9��m�@<)��R�k@>����.@@�áo{%@B8K�ѡ@C�;YX��@E+�*ǋ~@F�}�w�@HD�.�p@I�3�m{�@K~�Dsב@M(Z�ȇ�@N��I��@PI�R�$i@Q)��l�@RՈ`vH@R�YT>�B@S�Q7��@TΥ��8@@U�?Ô��@V��b�q@W�� �0)@X���@Y���Q�@Z�Wv=�@[��*�@\� (��@]���qi@^ġ#0�@_��H3}r@`q�|ͼ�@`�VV�"�@a�,�M@b9J��@b�{RW~�@c-�\�-�@c���i�@dN`��\@d�V�	�7@ess�$9@f�d�� @f���@g3���r�@g�.5F ]@hc�nغ�@h��(%�@i�`}�        ?�K	X�?�_$�v\W?��jt�@	Rn��%@*�鄨�@ݦ/w\�@!ֳB�@&½�O�o@,)��+/@1>%?�@4#���!@7w	cR_@:�7��J�@>�.�?W@ABg����@CD�i�@EY`��In@G�yPNf@I��%�� @L���}�@Nd����o@Pi(ʟ��@Q����@R���t@T=o/F��@U��4��V@V���&�G@XU��_A�@Y�Tզ��@[3�F��5@\�;Y�D@^-��a@_�IW��@`��+�Ֆ@aiN[;8@b5Q���@csK�~$@c�o9j��@d�5���S@e��>�1�@f\�ŭ(C@g9�}C�@h*�	&3@h�#K���@iߞ���|@jƒ���Z@k����̴@l���ДT@m��Ӱ(�@nzR���@om�+0@p1��~�@p��_ʵ�@q)uI\@q�S�-��@r&J_��@r�UO�.@s'q^�D_@s����M�@t,���P<@t�^��@u6E�K�v@u���ƙh        ?�2z@�75?��FH�t?����u?��īצ@t��@w��9�@?�<�@@�o+6r�@�k�i��@��j�@"f��K@%wQ)q@(�V~�UH@,��0;�@/����U@1�V'��@3���I�x@5���k|@7��XJ�@9��7^�@<u���@>c���v@@]o-M��@A��U��;@B˱'�A�@D�Q���@EWzD@F�NGKϣ@G�7�.�@I[��l@J�y��Z@L)v���R@M�}rIu@OiG@PE���^@Q@Y�1�@Qɼ��.;@R����@SX�y��@T$sq	*�@T򜘒M@U�QS�Z@V����\�@Wl(��@XD1*�:�@Y���u�@Y�;�#<@Z�$��i@[�A�ls@\��ͱ��@]��t#�D@^kd�n@_Tꐛ�3@` ;�.�@`����M@a�:�7�@a�v��|@b��o�@b{�c��~@b�1N��D@cs�O�q@c�ݼD�@do��D9        ?���	�,?�I�O�q�?�5
I�?���v��@3��(q�@@io�.�@��Y��@����~@!
�l�\�@$���c�@(hf��U�@,xRS暛@0bBP��@2�,��!@5WQ%L�@7{�KO�@:���5@<�~)�9@?x�!�1@A(@q��@B���6�+@D cQLU@E�c�WQ@G@p���@H��;��@J���xRG@L7r�
e@M��0�.J@O��/��0@P�~��-@Q��^, @R��y�q`@S�ߧ�L�@Tz�rD�@Us[�4G@Vo��@Wo~e���@Xr��@Yy�˔[�@Z�(b`>@[��bZP�@\�����H@]��!�2�@^�ȾsU@_��< @`�u|g�@aG&X�$@a��g�ɷ@b8%��2^@b̵��*@cb�K�<@c��[_�c@d��m���@e,�-��K@e��1F٤@fdo�!ۮ@g;hUI@g�Bٷ$Y@hA��(r�@h��	Ձ�@i�����@j)�V@jΉ���[        ?���|��7?�8[��?�٦�3?��xx!�@��@v@�5��U�@FW�\Ɨ@r�5d<@!�80�@%M�"9%_@)Cby05�@-{�e=��@0���/�@3T<�:@5˜��@8^�t��@;�P�ǀ@=����y@@Z�EN@A�B�tmB@C_=���@D�i�U�r@F�gڊN�@H8ބU�@I�|���@K��ǅU@Mm�0���@O=+'}� @P���y�@Q{2�Bx@Ro�Åp�@Sh�Q��@Te�t�,@Uf���*@Vk��n�_@WtU)��@X��H4c-@Y���8�=@Z�d�-�<@[����-@\�E�˨@]�h���@_��P+@`u(�@`��^�*@aGs��ة@a�����@bx��@cђ��@c�'���@dMe��@d�'Vn@e�_^�@f/�rg��@f�p��@gy�|}�@h �܌��@h�7�0]@isS���@j�aI@j�ʏ@kz�ۈ��@l*��	$        ?Ҝ�B;O?��W��@ 1�A�OR@��'~/�@�
��<g@QV����@#{��y<@(���6�@.�k=s�@2���]@6�@a�@9��#�}�@=�d��E@@��I�j.@CJ��6�@EEp��\@G�[���@J,����@L���@O^wqq!@P�/�{�@R;>=6�K@S�� ���@U�N�!�@V���@X	V?�@Y����@["�CJS�@\�#0�k@^[zt�@`8�y�P@`�s���@a�(6AJ�@b�A��5�@cr�<��@dW\*��@e?;��o�@f*=�]�@gU�;�@h	r��{�@h���Y&v@i�_A�@j�o���E@k�!��"�@l�	�W@m� �$@n�|�'@o�����G@p�`@�Rv@q���p@q�:vh�@r��C�@r��F�%k@s,�'�@s�ˌ��@tF%����@tԞ�; @ud0�'�i@u��_2�@v���F�@wPa׻�@w�����@xA�rTT�        ?����?ـ�ߌ?겻���}?���p`Wk@4�����@*����@��	@sˏ��@RBP�-@�Q��J�@"$�/j{@%)p�ҥy@([���Ǡ@+�I��\�@/=�-�<@1uI���@3^��z@5Z4�%>2@7g��N�@9�A���@;��� B�@=�ʿ��@@"�k�a�@ARӣ��a@B�f���@C��D��@E�����@F]�h��%@G��Q���@I�*� @Jqg�v�@K�.��n�@MK����@N����@P p�&7@P�[q��@Q��l���@Rp}r�+�@S<Աp@T
�j�>I@T�b�1,�@U��|�w�@V�c)0��@Wb�N`v�@X?��^�@Ylȝ�C@Z��?x3@Z� ��g�@[ξ��_�@\��b�p@]��
�@^�T��v�@_�23 ��@`=��4��@`�X''�@a5�Z_Q^@a�c���@b2F)<�K@b�M�{@c3v�.F�@c��s9p�@d9�&�@d���Y?-        ?�@1���	?�g�YJ=;?�*Ã"�J?���hmX7@]}'m�>@]�o;uP@����@��LQ��@!)�\��@$��M��@(�꯮j�@,�	@ @0���@2ƀby�$@5(���/@7�6M���@:;�|�@<�A����@?��nnhf@AE���@B��SoC@DB�$�X�@E�ȃ�6@Gi���H@I�v��@J��{��+@Lk��U�}@N)��C�_@O�y}��q@P����'�@Q����5�@R�=��F@S�E��7@T�tg�=@U�����@V�x�ő@W�%	G��@X���k�@Y�t_*��@Z����@[��K�G�@\�)��m@^͂?L�@_$�[d�@`!�W!�o@`�����@aE���Ep@a��TE@bo�9W��@c���v�@c�&��k@d9���:@d�I�G�@ep׀i��@f��iny@f��W?E5@gN�P�"@g�mIL�@h�B�@i6z�T�@i�s�U@j�@����@k(�`I        ?ķn��?�q��,9�?�R�BY��?�<���!@�hz�i@�,�s@���e3@[�g�@!_+���@$�!�p�A@(��X���@- �0��B@0��ؚ��@2�@9w@5d�*�$@7�>MuB@:��	�@=7"U�v@@�{��@Asz�@B���@Dv�:r�@F�{Ư@G�K)�28@II����&@J��$�S@L���Bo@Nrl~'G�@PU����@Q�a��@Q��Xn�@R�s��"�@S�m�i+!@T�a;�آ@U�8�*�@V�ߘ
P�@W�?F���@X�@�-s�@Y����L�@[Ҟ<5�@\;R.U1@]+�Ȑ��@^E�"H<�@_b�^;�@`A��~�@`�$,�
S@af1�w��@a��hkD@b���&�.@c'�SH^@c��7���@dZz�ʞ�@d���)%A@e�E�B�1@f03�@f� 4L�A@gohU ��@h�áC{@h������@iWfMʧ@i�`�a,�@j���,�@kI�Y��[        ?�^�2<�O?�Ȃ��?��R����@:�y9�@��v�T�@���Mħ@#5�o/[@(�o�ʦr@.^�᏾�@2[ ��o@5�J�.	�@9a��46@=6efc�@@���V7�@B��J��@D�uQ;Τ@G8iv�)@I�'�V�n@L�l�@N�kٴ&�@P�烣�@Q�W��w@STI�sJ @T��%(6@V3��=�@W����@Y7SN�@Zŧ�vU�@\\�����@]�È�A@_���@L"@`����^@a��*�
5@be\�]z�@cI�sH�@d0��wq@e��Q�,@f δ.@f����v�@g� �|@h��z�}q@i��\]@j�o��k@k���@l��d�)@n-ʤ��@o�D?C;@p��m�@p����T�@q$���9�@q��#�J�@r?�����@rϦ-�T@s`�tI��@s�7;��@t��2��@uC�aK�@u��/��^@vJ�!�X�@v��Jb@w~f}��@x+��9�@x�2��Q        ?�I�2��?�1#��?�c��W�?�yɑi�3@����@�N���@����@0`�\�@����B@+���-@!ݼ�S�@$�E��V@'��/q6@+6�J��@.�zأ�j@1�_�@2�oǯ1�@4�Ac���@6ұ+�n@8�1��$@:�E�c^t@=|�1��@?Fl|-�&@@�ׯ0��@A��K���@C^4��-@DG�P5�j@E��l�@F��Չ|2@H+`�H@IL�B@�Y@J�N+��@K����}@MKr�2�@N�7��c@P='1��@P��r��<@Qr�=kz@R,CN@R��<'�n@S��DLT@Te����9@U(��@U�]_�Q�@V��>�4k@Wz�x_�@XEGN%@Y&g�0�@Y�Jn�@Z���a�@[�j�S�@\S�LZ`@](���m�@]���P�@^�Y��77@_��tt
d@`GMO���@`�u@a%��%�@a�d`/3@bF��c@by3��j@b�ݴ�(�        ?�F3B�?�A�%??��X�Σ?�����G�@"�cv�@1�t1.@|O}�0@ds"|.Y@ �/@@$r��bID@(6<�̳W@,6rS���@08���%@2p(e 	l@4�(�T��@7,��L�@9�.Y�m�@<H�$ٖ@>���q(@@� �j�:@BH�gPA)@C��P4��@E<�2�jn@F�#�W�@HT4��@I��n��@K�x�W��@M6 A�n@N�c��v@POE"�Q@Q.���fO@RM1pRB@R�+�`��@S��lg�@T�;�a�@U�F��a@V���ƞ�@W��P��@X��Nr1�@Y�e&�n@Z�U��@[��)���@\�\4���@]��OEfD@^�鼶3�@_��U��x@`s�t��
@`������@a�ݔ�@bY���e@b�)e�Y@c1�8@c�~f:�@dSA�"�p@d埕�G�@ey����@f�N�@f�R���@g:
��@g����d@hj�m�)�@it�}_@i�L��m        ?��:9�W?��SB:�?��vyf?�'�����@���c�@�ޞ<��@6xW�h @���d@ ��!�W�@$4b�f�@@'�^)�>@+���_?�@0���@29�j�C@4�{	4>@6�ا���@9e�~�Qw@;�O$�cB@>�v���@@���V�@B9�ߒ@C�h~��@E�Q0�b@F�t�c��@H�V�N@I�T��Ы@KJ$����@L��0 �@N�g���@P):8�d�@Qo�}6@Q�?�k�@RΔ>>�@S�V�T�(@T�o@�H@U��7���@V�B��UU@Wz�:��c@Xsi�{��@Yn�L��K@Zm\I�@[n�x�s�@\r��TT�@]y&��k#@^�]�Rt@_�!��Μ@`N4P��@`֓��7@a`)�ER|@a��J��@bv�++�x@c��w@c�0Q��^@d!���m}@d�� ���@eCh���@e���{�8@fi��t�@f��O]=@g��fhcL@h*4��q@h��Y�a@iZNӨ�        ?�R ���d?��p�
��?�1R+��]@	�>mm�~@w�j��@I4��v�@"�i2a@'�Y-�@,����Y@1D�R��@4q�=�tp@7�d��G�@;by���@?r����@A�p���@C�K����@E�Pf��@Gӧi�u�@J����{@Lb~=�y@N��b��`@P�l~r��@Q�"�7P�@S Iwy��@Tn��q�6@U��!�@W y^���@X�����@Y�QI��f@[]���@\�!G��+@^P�:e_@_���z*@`��t�@au�N��7@b@M���w@ct4aP�@c�V�b�'@d����@e�����@f\��+�@g6��(�@h:��O@h����m@i����@j�b!�@k��NF%�@l�_�ܧF@mm �dj�@nX�*�͂@oFX@L9�@pO�M@p��{�6?@q�_��I@q�di.VF@r���N@r����@r�V���@s|�ӑ-1@s�4�f��@t|w�'@t��k�x�@u�gr�3        ?���X�?���vS|�?�� gEol?��Tߗ�@ �����@q�/\�@(��W�@��:�4@�ҝ�ǂ@�-�ʊ`@!���x�@$�g�n�"@'���UM@+"`)@.�� �I@1 $4h@2��D�0@4�]s$�@6�WRZ�O@8���G@;f��!�@=U��aZ@?��Moh�@@���CY�@B+V8��z@Ce_�$��@D����@E�\Ed�!@G?�w�@H���V�'@I�,��Σ@KWg�ʄ�@L�I��e�@N3�~�"�@O��j���@P��̰n�@QWS}��M@RɈtd�@R�W^y��@S��Hڊ@T���@UQ2��$<@V%ǃ@a~@V�L80�@W׺�(t/@X���X^@Y�<N�-@ZxB�94@[^P��t@\F�)���@]2!7�Ü@^ Ik$��@_-̸�@`b���@`}���x�@`���W�@awʔ�;h@a��55ȿ@bwIS�y@b��=�Ͽ@c{�B�kg@d ��rh@d���{>        ?�0l>x�?�]��GR?� �K��?�ԍ�︠@N�J���@R�
V<�@���8��@���!@!�:6#�@$�k��X�@(y ���@,���j�@0h����@2�t<I�@5��6f�@7yXdv�@:���{�@<���Sу@?bF��c@AM���@B�����@Dx����@E��)���@G
jF8�@H����@JJ�I+�6@K�W��@M�<��1@OV�1��@P�<�^��@Ql���@�@RSq�%z@S<�i&@T)�h^�@UE�<��@V��;@W�:<@W�M���@X����ƿ@Y�I��,[@[ �|%X@\xLz��@]�
�a�@^5yTO	@_,3~N{@`�8�[@`�[`�H@a4e���@a��g@bN��@bݼ?�@cm�=p�@c�آi�@d�|ص�@e$��'�@e����F�@fO/*h(�@f��t�P@g}����@hw��U�@h�I��2D@iK�u�|@i��[1f�        ?�f4u'�?�>�����?�!ө&N�?��3{+U@l���V@lA��{@��]�ai@ۙO�g@!?��=�@$ٔ��%@(����{�@,��Q5�@0��ԕ&@2�@m4��@5I�""�,@7ʥ���@:e'ȉ�@=1�T@?����9�@Ab+��c.@B��ώ@Dde�K-�@E�5��R�@G�G�]�@I4�VA�@J��	i=@L����1�@NY��;t�@P�X@P�E��@Q��߰�@R֥"P��@S�3b38�@Tç�:@U���m��@V�q�@W��"��@X�0�Pw�@Y�2g�@Z��:�C@[����f@](8@^$�QG�}@_@��l>�@`0#դ)�@`�c����@aT42��@a菒:�@b~pM���@c�R)q�@c����@dI/\t#@d��?ia@e��A��	@f ���{�@f�zQ�Ӫ@ga���8+@hVm|<�@h�6���*@iMX4�J
@i�݃b@j�J��] @kDn�O        ?���2�k?�ua���*?�Ջ���@	p�}�UV@F�K�Sl@�a˗@!�r�p8v@&��V�(@,jln�[@1=S$�@4s���"�@7�0I�/@;�KO�@?Pׁ���@A�>���@C��j�H?@E��'�@H+���,^@J�!岊B@L�NYY��@Of�,މ@P��m`d@RK�7j�@S�Nr-*-@U��6Bm@Vr���<@W�;20@Ya�\�r�@Z�p&~G�@\q�P��@^�z���@_��5x@`�5]k@avG.��K@bOx��@c+dgen�@dYw��@d��3^�@e��{N�e@f�R}�<�@g�5K+Tz@h�z���c@i��@Χ@j���si@k�V��@l��lK_@m����[N@n��wC@o�0R0W9@pP^y�I@p׼�7%�@q`��2�d@q�2��c%@rwAj��@sד�W!@s������@t$���O@t��k�R|@uJ,g�;q@u�1J�ˮ@vu���[@w�\��;@w��d��        ?�
`���?�ݣ�/܌?��f�{�?��6P?@|�7���@�D$�q@K�<�0@���[��@��X)@-c�B@"|>]�B<@%���/��@(����Ӛ@,GV��I�@/��_�M_@1ҕ��V@3Ǻ��5�@5��`�@7���^�@:*���@<S���u�@>��|��@@�B����@A���2�4@B�n�[�@D>b�=�@E�Ź�|e@F��y�A�@H@mg�/�@I�,�1�@K	3��@L��IQ`�@M���|��@O~$����@P��ʲ��@QI�;�@R����x@R��s�9\@S�䦅@T�x)�R@UZ�n�A@V46r�N@W}dL��@W���4@XѦA���@Y�t�]��@Z�	��@[�\#��@\ugot�O@]e$��P�@^W��K��@_L��ѻ@`"#d���@`�C�ǯO@a�U� �@a�Z�k@bL���@b�~��@c#��MY@c���{t�@d.wӮu�@d���09�@e=ˊ�h        ?�k6y�W�?��*��;?�O���:<?�&ITu#@�g!�w�@���L@�p�ZE@�U@��R@!J�D�>�@$�+{ǲR@(�O�ř�@,�U����@0�  D@2���]	@5J�r���@7�o���@:c-��@@=���@?�7K�u�@A]Q��ӊ@B�E�.�@D[�4���@E��.ا?@G�8P�@I#�^���@JΈ�7@L�Wg��%@N>�I��w@P6֧$@P���x��@Q���� @R³�à'@S��� ��@T�c���@U�����&@V�<��@W�(�K�@X��W�z�@Y���e��@Z�.�ޱ�@[�ƄI@\�<��u@]��-�Z�@_G7��@`�c@`��b��@a:Y^8�@a�Ex�ݘ@ba��9�@b��L.��@c����03@d'�~/�@d��C�]=@e]��(@e��UͶ=@f�&����@g8�����@g���J5@h|�u�Pd@i o�~��@iœ���6@jl��j@k���9        ?Ĕ>�1}�?�T�dH��?�4o��l?�	��t�@~�$�@vL��$	@�ȷ@�i���@!Bc�b�@$ٸ���@(��Qؠ@,�'�o�@0�����@2��L.W�@59�|8�W@7���M(@@:H�(7V@<�~� ��@?�� =��@AG/"�9@B����N�@D=�g�6@@E� W���@G[s�T�@H���G3@J�9��@LK����@N�
��@O�8ڀ�@P'��@Q�v�q��@R����@S�Ss�@Tt'�z*�@Uir��.@Vb��G@W^K�[@X]5��*@Y_�*�L@Zd���Z@[mX�t�#@\x��i-@]�5��=�@^��}8�@_��R3~@`a�0�yu@`���c��@a}Zۂ{@b&�Z�k@b�T5�U�@c0�2�Oj@c���@dY�	�Ny@d���x�@e�^$�.(@f!��*!�@f���Q@gW�.p@g��4X`@h��"P�@i2Jݩ��@i��u��@jt���$�        ?���l�4?���A?���G�@
~����!@�ꠚ@'#��@"��K{_�@'��;��@-�5��}�@1�b�;�k@58�o��@8��QǱ�@<�AC��@@8��n@BG��Z@Dn��L��@F�yY�@H�s|�?!@Kc�꫐@M�dQM�@P6m^P�@Q�b�sg�@R��:�l@TB[�ьZ@U���J�@W!u3g2@X���Z�@Z"Of�Tb@[��Pl�@]C��t�0@^�a�ײ@`B[�%�R@aT�}yb@a�\�g�@b�n�0�@c�nzLBa@d��WF��@e}a\` @fh��7��@gW];�p�@hI�%;@i?�0
�@j7�F��y@k3����@l2����&@m4���ؘ@n9����c@oB&?��@p&�K&3@p�����@q6GV��.@q�G]��@rK�4�h@rؘ�d�m@sf�+�t�@s��x�l�@t���"oK@u%�|g@u��J�
`@vC0Q�@vٹ���@wq�aj!�@x
�+��s        ?����݁?٠��y?l?�լ+�?�ڶ8�A@K�7r�@?�J@=�s�@���0�@x��A��@˗���@"A�ƴ�@%M�żU@(�p>��@+�V ?4O@/z�t��@1���b�@3�����@5��� @7�,�j@9������@;�t0{=@>;ʙ )9@@I3@I� @A|uBL&@B��ع�@C�)a��A@EDK��b�@F��U�@G�j���@IN!0r�@J�ǳ�$�@L"?E+~@M�i����@O'ڇq@PI-J�[@Q�'�@Q�͍bYU@R��w�ܰ@Sj��]!K@T:a8TWS@U�+Ky@U��d�@V��"���@W��1�J�@XsGg,�@YS��]�@Z6N����@[�V��@\sH6a�@\���F5�@]�d`^��@^�n8)s�@_����@`W5����@`�"��R@aN&D\�@a�;O��<@bI]!��~@bȆ�IV�@cH�d�
@c��]��!@dK�p�)�@d��<0        ?Ź��I0�?��J���?����?�� 7m@�+��@�/&�@4�1~>@XK��oo@!�~Xg+F@%6� I-@)&N�"K�@-W��:g@0�n���@39��Hԉ@5�sT)X�@8:I޷��@:�o�,�@=���x�@@>�{�7@A��Z�;_@C;�}��@Dʭx�k�@FdMb�kf@H*�G��@I���g�o@KmS��@M.tծg@N��k���@Pe)�l2�@QR�3r�T@RDuX��@S:I� �|@T4 '�@U1�F��@V3qah�@W8��>@XA��e@YN���y�@Z^���`@[r}����@\��{Cy@]�
}4d�@^�ĂIHW@_��li@`�kXr�Q@a
5���@a�2lUʗ@bB���@b���@ct����.@d����z@d�H�B@eI�؊�@e� ,�j�@f����7�@g+j1��@gΛ,H��@hs�H+]@i��x��@i�Ԩ�A�@jh��@kt��w6@k���n        ?�O�tL3?�p���?���[H�?��Nt�(�@,��sEG@=ͥå%@���e�-@���O�.@!
4,��	@$���tT@(g��u@,wB}�ǰ@0ahBH�o@2��k�h�@5�,�c�@7y��=6@:
�4^�@<�:���J@?u���@A&+��ƙ@B��ꑄ�@D��-�@E�)=��@G>o�T�@H�a����@J��R|� @L7\F]#�@M�����1@O�^��J@P�����V@Q�뢮U�@R�F�ڠ�@S��n�p�@T�
��J�@U|Lס�@Vz`�@W|9:��@X�ˀ�" @Y�
r�V�@Z��a�V@[�W,�@\�IaJb�@]Ӵ��R[@^���@``�#�3@`� ���B@a)}�L�@a�p�ΰ�@bR�\%��@b��-nP@c�{�m�R@dz��G@d��/�r�@eṮA=@e�'?��@f���@o@g3�q]�@g�4c�2@hy���?�@i�~�@i�kLln@jms\�@kz�t�        ?�;;ś1�?�>�AU�?�����)@
���qk}@o>��y@� �z��@#
2�o��@(PFh�Lr@.�l�Y@23�DW�{@5�����@9-�z @<�xa�(�@@}�(���@B�O�%�Z@D��Z���@G���W�@If�6:��@K֐��$@NZ�Z��@Pyk�R�@Q�q��8`@S-���?@T�͵3�@Vb�)M�@W~���|@Y N����@Z�C�ji,@\Tx�X\@]�Y��@_X+�2��@`��_��@aYJ�R�@b5n5�,�@c(iG�@c�g��G@d�&"
@e�,��0@f���C@g�1�-D�@h�d��*@i� v��@j����@k�c��@l�Man�@m��J�@n��u�'@o�P�5K�@pR���@p���c�@qb%s�Q�@q���f�_@rv�^�i�@sہ�>�@s�=ִ��@t�2�-�@t��1�	@u?���84@uя1���@vd�9�Ll@v��앪�@w�Cj��@x$���W        ?�)��;�L?���ƋX?�9xv|/?�TX}_�@ ���j%@��^#:l@f�����@a!�@�="��F@�Cg��@!�[���/@$�׸���@'��bJZ�@*�)�U/@.@�B閿@0�2�(}@2��_��@4���_�@6���L�<@8~�Q�@@:���1.a@<���vu@>ˍ�̪@@��y@A�w?ve�@B�I����@C�� ��@E!撿o�@FXRZ��#@G���,�@HԈ0S	@J�@KdI�k�@L�1�##\@N��Q@O^���,@P]_֨# @Q�!�@Q��"��@Rt+�O��@S*n��VE@S�	�rt@T��F���@UX�#G�@VHZ�64@V��i�pl@W��CM��@XY�95�@Ye��,j@Y��.f@Z�]���@[u�z�q@\@��Z@@] �&"�@]���ک=@^�B���|@_{���1@`&�-��5@`�}#�� @`�WM�@af8��d@a��/@b>����        ?��Ux�?�$�s�i?��lY�?�s"=�l@O��Z�@"A_��@l�E���@X�:9-@ ��vn@$tr�ˮ.@(>��ܵ@,G���lY@0FH9�=@2�&h.W@4��?*@7Sq�'�@9߷O��@<�:ӴS�@??��L��@A�'�+@B{ס�h�@C�o�[P�@E��M�� @G?��B@H����-�@JP1�@K�S�L�@M�!-�I,@On;�W?=@P����g#@Q�=���@Rj�
8Cm@SX�G��@TJ�i��@U?�Uږ�@V8��Ӎ@W4�6o@X4��h��@Y7`v���@Z=z�=@[F��f�@\S �;W{@]b����@^u	's�@_�t��=@`Qe8c��@`���u@an�ݸ@a�tr��8@b�@ӛv�@c#fe��>@c���iԨ@dM�1�	�@d��wCX@e}?\��@f��nʕ@f��B'�@gM��h4V@g�)�C�@h��&�6@i)��7�@i�ļ/en@jmR��]        ?��m��
?��*4�q�?�=r
�+?�'��w7�@�|�b��@ ӏ^B.@A�M��@",�W��@ ��t>W@$LUk��@(�M;�@,-��ur@0%?:�cF@2^Ԥ���@4��WF'�@7 x��l@9�6�N��@<C@��^@>��?�L�@@�����@BN�W�0@C�n"q@EJ�S�@F�Y'�4�@Hl�%�@Jt&�E�@K��WsA�@MbX�tc�@ORGUd@Pm/l�$@QQ$޵�@R8� � [@S$x�Ԃw@T��$�@Uf'�	@U������@V�>��/@W�1�>�<@X�e4.��@Y�ʨS��@Z�T�IP�@\�S��@]����@^#D�O�@_5�.	�b@`%��|��@`��yf��@a?[��ʔ@a�J�#��@b^�M/z�@b�97��@c�-db�@dl���+@d��U;@eC��-��@e����at@fu	��b�@g�Z&x[@g�)��T�@hH4Q޶@h��^�@i�0�<}�@j%��!�        ?�"�Ԓ�?�u0o5i
?���xae+@	c�����@5Κ=�@�5��!�@!ܷ��ҫ@&�Dq��@,*�� 8@0�����@4�j�@7m#�HtF@:�Fߜ�|@>��OI;�@A2=�o�@C.;�vn@E<�^u�g@G]Q��y�@I��+=K�@K�W
fT@N!�QM�@PA�j��@Qx�]H�@R�.x,7}@S��Q��@UHsl%�@V����~@W�k�'S@YQo#P@Z��IKm�@\3~_�1@]�Q�[�@_� �c@`>&��Yw@`�r�^��@a�2ѮF�@b�X̴@cI�6�@d�ƇЊ@dݲ��Cy@e����b�@fzlm�Ob@gK�@�V@h����@h�Z%�Z�@i�"�^�@j����s�@k�R��@l_�v�q@m?7�f�k@n s�p�@o~}S��@o�M�5�@pgkYU|	@pۉ\9�(@qP}aM��@q�Cm��@r<�@�i�@r�4v4��@s,W�s@s�;�u��@t�4�>'@t�A�L�        ?���mCï?�sƎ\Di?꧂-�?���D���@06���/@���@d߰�Q@r��{@S���N�@�n,�J�@"&��%}
@%-_nQ
�@(`�{cm@+�4"���@/Fp�%� @1z�&�e�@3d��0;@5a`e�3�@7o��o��@9�Z.�@@;���7�@> ��m��@@(�I&Ԕ@AX����@B��]�s'@CϞ�\,@E��O��@FcO-�[�@G��ҙ�w@I�_�@JtR��_@K�{;�H�@MJ�����@N��pGi@PH�]HU@PݯU@�@Q�(Q,m@Rg-���@S0#[P<�@S��*���@T�3�~͜@U�2�@Fj@Vn����@WD�'R��@Xr~��c@X�v���@Y�ހ�~�@Z����X@[����Fu@\|&b�M8@]b��G(@^K���E�@_6����@`�V��@`��JT�r@a|?`@a|@j�+_@a�q��`@br����@b�KB�@cmH��;O@c������@dk�� ӗ        ?�;5�4�?�c<�W u?�&�=�?��N��Em@X!6{E@Z@E���@��.Շ@���B��@!&���c�@$���a!@(��d;o@,�#�.*@0}�e`6@2�h���@5%>\~��@7�d�Y�@:6�� �@<�o}�U@?�rn��@AB	Z�@B�&��<@D>S"��@Eˮ���@Gb�m`�-@I����@J��l�i@L`�d�oh@N���;�@O�����@P֡Q�.@Q��J�P�@R���M�@S� �6p�@T��q��@U�i��ľ@V���V��@W�7?p�7@X�cq�h'@Y���)+5@Z��yA�&@[�2�m@\ĭ	*!@]�N�)t�@^���R?@`�+��\@`�� ��@a$�yz�@a���-�_@bI���@b��!t�@cs��>@d
jk��{@d���@e;�R�:@e֤I�oX@fr�.�U@g����#@g��~�Z�@hMK޹.8@h��l�ґ@i��SЅ[@j2�.�B�@j�ޓd�+        ?�J@��{?��K�}?��g�d�?�����@9����@H�7���@��s/�T@����@!x��@$�.�Z�D@(��O���@,�z�t�@0z�%�@2�wE��@5&����@7�w�e@:<s���[@<����@?��+���@AJ�R�B�@B�u	��@DK%(�Գ@E�I_/><@Gu�Lx8@I��N0�@J�S�:�@L~M��v�@N>Z6(�Z@P�����@P�Z���@Q�F����@R�G�K�@S�DH`>@T�&�Ws�@U����I@V�R���W@W�rLϼ�@X�%uV9@Y�V����@Z��pIh�@[��D@��@]'Pb!@^����@_696l�@`*v{��t@`�V:�Kg@aM��@�j@a�^��A@bv�D�l@c�����@c��dD��@d?{5?w~@dڂH X�@ev�"���@f�Sp@f��h5R@gT+Ѐ�@g��T�@h���9��@i<��@i�Y�2Qc@j���ٌ@k0�^��d        ?ч���]?��]	�?�x�f[}@	�hQ
�
@�?;�H@��y'@"W����@'m�-r%@-����(@1��1C�@4͇j�8@8EvT�m@;��`��8@?�Li��@A�K�<��@D��x�1@F7�b�F@H}Z�g@J�仼l@MD;-+�@O�WDӘF@Q+q�^�@R}�q���@Sدdy�@U<1r�@V�}<#@X�c�@Y���D�-@[w@A�P@\���;�@^9W����@_�EZ�K@`�*K���@a�0k��@be����@c@nLfE�@d��e�h@d��	z��@e�3x&x@f˲���@g�5��l�@h����RW@i�D;5�@j�SPK��@k}b���~@lv6���@mq�q���@no���@�@op܌a��@p:,D�3@p�2>��@qAy{�c/@q��cOv�@rM�4�h@r՘��0@s^�=e|�@s��6ܙ@ttB4p 
@u ��|�@u�N���^@v��� I@v��UC.�@w=t_�8        ?�v��H��?�$�,�?�e-���?�[~Z3@�X��3�@�]��@�C�:�@$8��6@:�w���@ĩy}_@"�B�0\;@&{"ϊi@)p��H&�@-��cJ,@0a�͝;'@2X#
���@4d?
B�@6�Z���\@8��stV�@;W��`@=a6���}@?�GA*@A)��"�*@Bt �@�@C�$�@E"���e�@F�SeM��@G��O��@Ih�$�$ @J��ؘ�@Lj�6�u�@M��V�-'@O��0@P�&�V�@Qdz.%$A@R9a�.��@S�!�@S���u�@T���@@U����r�@V����>�@W~�z9�@Xk���7@Y[G�^J�@ZN4"q�3@[D@���y@\=`�|��@]9��R�@^8��d�@_:�^¾^@`�ZV��@`���;Dd@a(���P@a�Y��v@b7;��!�@b�ke�H�@cJ�s:�@c֜I�"4@dc��#�O@d����@e�E�\@f��M@f�>��#>        ?���I�
?��bdc�?�S�[g?���6 Z�@�9~��@�Zq4I8@Ni�6��@{���@!���-@%T�����@)K��P�@-��}K�3@0���Rv|@3Z�l>@5�I�C�@8cÃ���@;b�p.�@=��üK@@Y�&mt�@AԖ�f��@CZm��g�@D�"R��d@F�Uq��O@H+��-�_@I��;SI�@K��8�xv@MUi-B��@O =Χ��@Py�ם/Z@Qg�zh�X@RZ	/���@SP8��@TJ]j^ֿ@UHc�b�d@VJ7۝G�@WO�g#7@XYʶw�@Ye����@ZvD���@[�*��:�@\���td@]�F�C?@^�h��j�@_���
&@`�R��\X@a$YXb�4@a� ��)@bQB8��~@b��s
@c�y����@d g[�@d����o@e\��~f�@e�Pg�H@f�G�0@gB���3�@g�
u>�@h���X@i5�����@i��p���@j�QH7�|@k57��:@k�~?���        ?�
�K�?�"�FP?��G��?��w��K@
����x@�;�h�@h�h�_�@�KVl@!���%t�@%q���c�@)oj�I@-���9�@1 � ��@3x�ڻ�@5�L�3B�@8�4���@;B'�׉�@>"��=�@@{���j�@A�Az�Z�@C��\��@E;.E>)@F���Z#�@Hk�z�@J!����@K�%cGô@M��;�]@O�t��y]@P�ԋ�`�@Q���9U@R���n�@S�Y�"o�@T�e�	'�@U��v�0o@V��$��/@W��$�;}@X���K*�@Y�D�b�@Z蚪�e@\�>��@]"mūv@^D+X��@_i��-��@`I@T���@`�^�6��@aw#�@��@b����@b��RH6@cH5f�3@c�u����@d�OO�@e'�|���@eʻZ2m@foB��c%@gL�`Z/@g��r��)@heԨ��Z@iH�z��@i�-4P��@ji}]"��@k4�>|@k�N�Q,�@lyƎ�        ?�;�y�?���f�?����D�@
���kHV@a۷ϛ%@��z3�*@#l���@(e;���@.G�6��@2W�����@5˘c%��@9{ݪ��M@=f�Q��@@��Cw& @B��ۓK@E5
��X@G���jV@J
C��Z�@L��O�2�@O=�3�0@P��u/.�@Re��ͅ@S��Q��d@UV��σ1@V���[Ga@Xq�Ո�@Z���#@[���u��@]a��^�%@_�e�p@`m��dǏ@aR�̆�@b<P��ê@c*)׵=F@d@��o\@e�U|qh@f裗�@gZ�4@h̫R@i/tޝ�@juI���@k,�b,"@l>p�䁞@mTjo,"@nmD�ls�@o��Gh�@pU;rE1\@p�%��p7@qz*�4@r
���@r����@s?x+��@sَ1Y�=@tu.���B@uSF�b@u����M@vQb�۷@v���F@w��F�_�@x: ���@x��[Nw�@y��ӗ��@z/b
ިk        ?���U�?ٰ���$Q?��mT{?��	2m#�@W�D2A@N��(�@%��&@��֨2@�H\^͝@�H�PcG@"PV�V@%`!�1�]@(�Cx"��@,�D<�4@/����C@1��fT�q@3��3�n@5��HN�x@7��l�@9�8�^@<%}���@>r��:�@@h���@A�	�P@B��L�W�@D$h/�,�@Erdv���@Fǫۭ_�@H$�*��@I�k����@J�$��@Lbl�/�y@M��qzI�@OW�!஋@Pn��.�@Q3r��@Q��獛�@R�eb�f5@S��B��@TgVG��@U;�.�Z@V�ľ*�@V��9k�@Wɨ���@X�%%�t[@Y�Q���@Zp%9��@[W�Y��@\A�G�5@].5%��@^P4h�^@_訯C�@`{�k��@`|�x��@`�,�� {@av�>�6�@a��f�o�@bu�lP��@b��D~UF@cx�����@c��i���@d�;)���@e���v�        ?��T6�^J?�5��$?����G��?��]��@'d�@-���;M@y���@f�Fo�#@ �y�;�@$~�t1�@(J�W@0U@,V�?�1l@0O�JV'�@2�0+���@4�E0]�,@7e�2]i�@9�E��Wv@<�3���@?b�k�f~@A��Dj@B�J�b+�@D��I@E�Q��/�@G;9�2ղ@H�^.O�@J�u���~@L:TC?8�@M�f8�t�@O�rI��a@P� �,�@Q�бdg@R����,0@S���'��@T����}@U�� -�Q@V�OC ��@W�Ɋl�@X���@Y���[@Z��߁�@[�����@\ӈ��@]��1\�]@_piM��@`���@`����@a6o<�&@a�X@��@b_�d�r@b�z[�^i@c��W-ݤ@d(K^��@d���I��@e^�a�;%@e�S���@f��v(�@g:���M@g�ǫ��@h}���o@i!bi�H@i��y�y@jk��.��@kY���R        ?�K�҈�?��� @�?����˿@ %6\&�@vה+$�@)o�D��@����L@&/��@"�:��@%�*(D�"@)�d7�+@.B�'S@1m�L>��@3٘/>�)@6c�YV�@9	ˈE�@;ʳ�6��@>��dh�S@@�['�v�@BU�yO.@C�8���@E�y��.@G31��2i@H�:��@J�����@LuqH0��@NKqi��~@P���?@Q�o'@R$��6H@S�@T���u@UX�[�	@V	H�~@W/D��S@XE����p@Y`k�B�j@Z�w2�@[�FZߝ @\�-iV!�@]�K�fB{@_'��h\�@`-�r�M@`���o�@ah93��@bC�Z�@b�0)��v@cM�d'�@c�R�&@d���`�@eD��Ol@e���!�:@f�tG,Hm@gI��Q�g@g��!\�G@h�R�p}�@i^�
�-�@j}�H@j��#5��@k�l��@l;�h5�@l�X �0@m��5؂*        ?҄�hP��?��&��B@ &O�6_�@��l�@�́4�@=g�(�@#nx�!�@(����Y'@.��L�A@2����hY@6辵�@9���$@=�x!tuJ@@߈����@C��M\�@EE�#y�@G��":h@J
I�k��@L��@F@O&�꤂@P��G�@RKB��@S��c+�@U*d�;L@V�F���4@X/Mb��@Y�<���@[W�u��O@\���.1�@^�YGeֿ@`)�E�@[@a��W�I@a�`;��@b���G�@c�]���@d����[z@e�wL���@f�	|�+�@g{8uJ@hu��:N�@it6~62�@ju�\���@k{�h@l����Cx@m�f�u.A@n��&�@o�⟵�@pc7�~�@pj(�@q}tl}(@r��sMs@r�� AN�@s0@��T�@s�+!��L@tY��aN@t�]u��@u��c��?@v"?�Gp@v�Db+��@wY�Pe��@w�Y���@x�_P:SM@y6��Ůu        ?�m6�1��?�D�]�?�{7YL�?��k�>��@��?�@J�i_�@�6б@h�p�9X@N]!~��@��&��@".�M0^@%<�3ޘ@(y��6l/@+�#��Q�@/yS�<-@1���d@3�/��&�@5��&"��@7��f�j�@9�3���@<2�\۶@>euj��@@bM���@A�&�N+@B�o�\@D!�s�F@Eq�%42�@F���2�@H'�(./l@I����T@J�70&��@Lo��$�@M���?e@OmpD�<@Pz��m��@QB�2�@R�J��@R۷q��?@S���BQX@T�BϬ��@UX�.fB@V2�m�Yx@WظZ�/@W�ƞ���@X҂=9��@Y�����@Z�C���x@[�:�rV]@\x�:�D�@]i/�b`�@^\�YL�@_Q��5IP@`$����@`�(�\��@a �Am��@a�y�X��@b!uB���@b���(4@c&��Z��@c����@d13�s�@d���hv@e?�7�Y+        ?�)Tu��?�Y��a�1?���f'�?���#@P<�c�@U���O@�ٷ*�@�9]�'@!$�R�@$��CH�s@(�n��@,��@?@0~9��w@2�It��@5'�:�N@7��h�d@:;�Q�@<�'�s@?��w��@AE|q|��@B�'s'b@DA,ּ@Y@E�6��C:@Gd����@I!^�;�@J�r5�:�@L`���@Ns-��@OޫN�@P�(��@Q��[���@R�[��u@S������@T���m�m@U���:@V�o�%@W�k�PV@X�d�H�@Y�3��o�@Z�`�=�S@[����@\���@]Γ���@^��5�J@_��}ˢF@`�����q@a��fB�@a�,7��t@bC4��w�@bׯ�'�@cm��:�@d�)�@d���;#@e7��X@e�k�y9@fpZe��@g�a���@g�Rݭ��@hOZ�g}�@h�s"�~@i�|��@A@j:��.N@j�	�]�        ?ĉ�۪�U?�G ��T�?�&�rz��?���rvix@p�����@o*�9��@��i��@�/�y�@!C���R�@$�x�8S@(���eZ@,�u�{q@0����@2����n@5Tt�� @7�l\yb@:s�ykX�@=(��@?��J���@Ak�5h�@B�s�Y�"@Dm�$X@E��nW�1@G����;�@I;�LP_@J�G�iX@L�I���@NY�~�|�@P��p�@P��e��@Q��{�.�@R���y�:@Sþ_��O@T�c�Y2<@U��L*�a@V��w;�@W�}�v�@X������@Y�{:d�*@Zΰ�h��@[�M�]�@\�F�q�@^�(���@_!,j>�"@`�586@`�
��@a@��܌�@a�ב���@bh���d@b��mwq�@c�����@d/�P-��@d��ˊ	#@egc9��@f�#5�:@f���A@gD�L�b@g���j&(@h�CQ�@i/��=@i�B��g�@j|�_=��@k%�=�s        ?�}�~U�?�cl=��?�w�1��@	�ͩ-�@��g�-@�'�)>@"l��F��@'�	y8T@-<��+��@1��ծ��@5�J��(@8����@<R��Nq<@@$^L�o�@B8p�5�@Dd�e��@F��j"��@I�n<�D@KqZ>V@M��6���@PG����V@Q�$e��@R���Q�K@Th|s�B0@U�ٗy�|@WXj��:�@X���za@Zlh^��@\vS��A@]����@_J��BbP@`}muUn�@aYrb��@b9h�>@c@����@d�p��2@d�Qp�5@e�g�NX@f�@��]@g�WG�*�@h��*��@i�9c��@j��:&hO@kÝ��P�@l��G'��@m�.���@n�Ε��@o��@p�Ɨ���@qL��@q�[gn�@r*���!@r���l�@sL|@oZ�@s�o�7�@tsͦ���@u	���l@u��Kb�A@v90:&�X@v��i��@wn%����@x
���Э@x�Q�L��        ?� ߼�g�?�	�S��2?�:r����?�W�{��X@ �5�c�@��d<@wUX�I@�c��@�(���d@ N��@!��L��@$�� �5@'��!��-@+"f��@.v��4@1 {N��@2�=E�<�@4���D��@6�>���\@8�c1��@:ә�kv�@<�g�:��@?+XO�Q�@@��n+_@A�����@C
[54N@D>�@л@Ew̮=��@F��V�>@G��AW�@IH@y@�@J��'P@K�B
*6@MJ���@N��Q	��@P���@P�IR*��@Qv4��c�@R0�+>{�@R�$FqB�@S�S�q@Tm,�b�@U0v��@U���J�@V�c���}@W���\
]@XR�ӿ��@Y *FjbI@Yﾇ0y�@Z�AS
ς@[��}�(�@\i�G�MU@]AU�w�@^�p��u@^��@�A@_�6�[�@`W���m�@`ǳ[��@a8���s�@a� �Ұ@b�m�@b��f�`B@c��k�        ?�K�ٖ��?�u5`�/?�:ED{�?�6���@s��qF�@m�b���@�Ò|m@��HD"�@!9!��t�@$�/Ⱥ��@(�b���@,�����@0��7�r@2�ޚ�� @54/<AL�@7����zK@:F1U���@<��ߩ+@?���P@AJ0q��@B���+ah@DF�Ly�@E�j���@Gj�I��~@I�ёV�@J����͎@Lh����@N%@5�a@O��n�/@P�r�2J@Q��o3�@R��Q�ͦ@S�I;���@T����c@U�����@V��H�Ϸ@W���Q�@X�ă�`i@Y� 7��@Z���<�@[���{"�@\�`XM�'@]��6��@^���|�B@`�C*h"@`�RCEǮ@a.Lİ�+@a��]}@bT�ٓ�@b��?���@c���4 @d�D��@@d�`>3�T@eM7Ӭ��@e�a`��m@f�׫�:�@g%�N[��@gŐ���@hfǭi��@i	5��@i��ԕ �@jQ����V@j���Q1+        ?��Ure?��d�??�bՐ!!?�?�o*�@���4@9�\�@N���I@/�>��0@ ��Q�^@$S���z@(���1@,W�1�@0'��� @2`��ę-@4��QV�@7 �/�i�@9���u2�@<A�@�L�@>����c@@ޅ�h|@BM#�-Um@C�؟Tf�@EHN��W<@F�6��%�@HiJ\��I@JE�|5H@K��c@M\��B�@OV& @Pi���u�@QM}1^��@R4�؜{�@S 5�g�M@T%��@U�O��@U���p>Z@V�4����@W��ߒ�@X�&_�@Y�?U��@Z��l���@\ ��3��@][��@^���Y@_.�Wp�s@`",���@`�9�@a;s3��@a�4S�@bZM˧��@b�w��N@c~r§a@doVP|�@d��a϶�@e>����@eվ�ҀU@fn�^
�T@g���W@g��Tf�@h?��9�@h�H<�Q@i{��`�@j9B�        ?�6 ���?���ә?����w@	�֔�?�@Y�KUI@!�$�@"�_�X@&��^8�@,u��x4@10 ��$�@4[�+@��@7��"/�@;G��iY@?�&���@At9R@��@C{�?v�Z@E����*{@Gă�,@J�?��@LV;���@N�Ѷ�4�@P��J҂@Q�J���@S _���@Tp�ʝ/�@UȬ�L��@W'w��d@X�����@Y�h4�\@[l7fFE@\�d(�a+@^d�t7�@_�XHu�8@`�����@a��ڂ�@bO��IE@c^c���@c�[�!�$@d� ���S@e�<=f�@fp�F�@gL4D�;@h)�����@i	Ђ��@i� �hU@jм�)��@k��ݯ?�@l��@��@m�
�l�@ny��l��@oi&6�f4@p-oQmo@p�R���#@q"9:��@q�"��@r��P@r��i!�@s�E�d_@s�U��@t���@t�wD\t@u��z�@u��2!        ?��)o�'?٪��K�,?��(��G?���#�z@Xҩ�@S���X@*�(��1@���@�A��*@��1`��@"Y��ͮ�@%jF�Ǭ�@(��+�[@,C�W�/@/�b�uT@1�70��@3���kV@5�x�k�K@7� Y��@9��W��i@<D�W7@>ZWC��@@XK�#J@A�V)�G�@B�הݕ@DOh�@EK���@F�D�;@G�b:.�:@IG�5gh@J��у�@LH-�6D@MzAQ�~"@N��.��z@P1x߫�@P����@Q���oY@Rt�{��@S:(6��~@T��o��@T���d��@U�G�� �@Vk-���@W=r�e��@X�y�@X��;T�@Y�7�|�3@Z���*��@[{m�.	^@\[W���@]=j]�`�@^!�����@_�|H�h@_�<]]-�@`mLZ�B�@`�yI��@aZ����@aҿ�0�B@bKѳ>_�@b��\�d@c@�n��@c���Q?�@d9Ud�S        ?�C)�I�?�>�e;�?����P��?��ㄦp�@'��e��@8��D@���ed�@~����@!��]z�@$��^�r�@(b���g@,q����@0^���m@2����=@5 -��@d@7xْ��@:
�Z��@<��ڬN�@?vx�hq@A'K�΂@B�L�F�@D�Z�@@E��[���@GA���#?@H�Q�3+t@J�e�j4�@L<��-��@M��8��@O����I�@P�S�]3@Q�U�#X@R���_�W@S���mH�@T�ǧY�@U~�Uh��@V{�)Z�)@W|ۧU�@X�Z���@Y�M>�@Z���h"@[�L�IjF@\�:zm@]�_� d�@^��O�t@_�QzD@@`�BK���@a��G@a�1�D@bD�|�]J@b٪@cp ��=@d��aI|@d��{�?$@e:���+@e֊q�o�@fs\�b�P@gl�5SC@g��3Ca@hQ=���@h��r�xu@i�� �|�@j:@�Z0@j�f�,�        ?�{e#g��?�:$	�?�g�� ?��f0���@YN홢0@]�����@���j�@�]���@!-}�?��@$�D�-��@(��G@�Q@,���\{�@0�A[�_@2���|O@54l�n{�@7����,@:M��@<�=���@?�K�-�@AUi 4�@B�}��+o@DX����@E�H}`�O@G�_]j��@I,��Dd@J�z/�B�@L��c�ey@NX�iK�@P.2 ��@P�la��^@Q��OE��@RݦH"4Z@S�oV���@T�5��X@U��h|�@V�d���i@W֨T{��@X���ґ@Y�0yH�@Z�Q�p�@\��.s@]+����@^GG���'@_e��Ո�@`CڟIU�@`�Y����@ajj���@b �w@b�-\�Ÿ@c/բ9B�@c���Zѯ@de�.,��@e��"%�@e�A�N�@fA7SWƥ@f�ϖ��@g�S0ײ�@h)q�S��@h��r`"@iu��n�@j�M[f�@j�F�d�{@kq��� k        ?ѫ�w �?�R}n]��?����2��@
246��@�-�#�@؆��qO@"�O��@'��Γ�	@-N�W���@1�
�J�@5�D{sm@8�k����@<=׼=Wv@@�W���@B�[�_@D?��7 W@Fw6a��}@H�A�&��@K#9'SL�@M�^V���@P�x�_@QY�АMm@R��(%j�@T
pH>]H@Un�Z�@�@V���v|@XNl|;@Y���E�@[J���@\�.%��r@^bA��_@_���r�@`�� x�{@a��Ƭc�@bn؉sV�@cEՈ���@d�:!�@d�~�+�@e�l��@f�i3c8�@g�y�@h�8�|�@iu��r g@jb�_�ؔ@kR:Bj6p@lD^��o?@m9��Xn@n0([�|@o)����@pق�)Z@p�)0��@qU�@�1@q�˼P~e@r`�'�{@r�9��W@s��6&�@s���f_@t+�D�hI@t�� ��@u<v��G@u�q{w@�@vQn��@v�il䫜        ?����I�c?�g�
�q�?�+���?����
�5@'+He�@�r�@� �M@g�o�d@F~�2�3@�#3�@"F/"
(@%&T��@(Z�Ri![@+�PL�@/E�uj@1{��'�@3hVÝ�@5g����	@7y�J���@9��&~��@;�����`@>8��@@7�;�@Ak����@B� �_��@C�;nC�p@E5�:@F�;Q0�X@G���~@IA:�~�y@J���b"@Ll�D�@M�/��ez@O��?@PD�[���@Q	>�e�	@QН��l~@R��TN�@Sh�fKݶ@T8��cr@U\�g�@U⣓�_�@V���I@W��I"�R@XvQ�J�@YW�0�j�@Z;�;���@["S��ʖ@\��ʮ@\�>����@]�u�n'�@^�$���L@_�G"ȗ�@`_kd`�@`�f���"@aX�� @a����@bVv�Ya!@b�'��6�@cX�X�mh@c��U;Z'@d`{�I�@d�Ti�ʉ        ?�2>��i�?�]�-��;?����A?����:�@K�z�X�@P@�n4@��hq}>@�K��+@!!|���@$���C�@(sm�A{@,� 6�@0e�L��@2��THE@5A�>��@7v}�,�@:�X��X@<��a�k�@?g�D��@@A��$
@B��3��{@D��F"p@E�x&-�@G/
i�f�@H�Q�E�f@Js�0O�@L#Z���@M�A���@O�<V�@P�H�[u\@Q��i.�q@R�v�#G�@S}3���@Tr�c?Tq@Ul��8�@Vj1�"�@Wk;�͎�@Xp�2��@Yx�ߓF@Z��J��@[��P�['@\���dx?@]��3U��@^��92$4@_�f���@`��Z�(@a7e���@a���Z��@bA,�_�@b�γ��
@cm� 9��@dCY?r�@d��Z�@e;/~OG�@eק�#�8@fup��0 @g��*a@g��Q>@hV~�I@h�Y�i@i�p?�U@jB�JV�|@j�CVH׼        ?�ǁ���[?��?��?�r�?�wW���@�����@�8h,]�@3r��@Yt�iV@!�ydI�@%:Wj���@),@!���@-`�]�G@0�em7@3A�Ieo@5�Ɍų_@8GNMI@:�vI�~=@=�D`��@@Jdd��]@A�T2-@CK=x�iE@D܋/p��@Fx���@H1�
�@IϾ���@K�5�7c�@MNC|AX@O��/��@Py�)��@Qh��Ł�@R\�wq��@ST�E�̄@TQ]��C-@UQӜI�q@VVEވ��@W^���>l@Xj�U�-�@Yz�f�t�@Z���f�@[��X@\��&���@]�{�L&�@_��t/@`�nk��@`��^�w@a>F_.�S@a�+-�+�@bo�� w@c
�~ҍ�@c��'"ڣ@dF,9�R`@d�,A���@e�����	@f*�n��V@f�ut�K�@gu��`@h:yH��@h�Z%Dip@ip�;)d@j
-
�@jʖ�T�@ky��z�+@l*?w�	        ?���G���?��lq��?�ae6#��@
�ݮ�?�@C��_��@o$���@"���M�@(&\I��p@-��)�@2�E�@5w��6��@9����@<���y@@nc���@B�n�p9@D�>k�'@G �s��@I^�y@K����G@NZ��EZ:@P{�>M��@Qԉ�rO�@S6��	�@T��^R�%@V-eԉ�@W��@]SZ@Y�݅��@Z���g��@\F%%�<@]��D�@_��N0@`�T�hW�@a|�T@�	@b\ݖV��@c@�-f��@d(s�@e�sҲ�@f�FM�@f��ʴ��@g����@h��м�!@i�y��@j�W���@k�w�]6�@l�̸�" @m�I���@n���:��@p�&�5�@p��mc�@q���@q�6lc�P@r5��\$E@r�+2k�@sU�!x�}@s�侦z@t{b���k@uG㴖;@u����{f@v>@�ȃ@v�MMV*g@wq�"Tb@xv�HP@x����M�        ?���ql�B?٘�NP��?����K��?�ؓ�gz�@J�:T��@>��3�B@��A�@��#��@u}��@�.��c�@"<5� f@%D?7�}*@(x�v��@+�ӛ���@/]���@1��+�CG@3meϷ�D@5g�=*�@7s���w@9�����P@;��}�z@=�s���@@ 0��	@AL��l@@B�K�Xb@C��D��@D�ؾ�=@FC��eln@G�G� l�@H��`�$�@JA~Y��@K�iw�Y@M����@Nt�ţID@O�s2'��@P��3x@Qm����@R-�7s�@R�k�lӒ@S�apӽ�@T̃f<@UJ��y�@VҤ��@V�W�M�@W�&E��@X�5��l�@Yc~9�q@Z;�b�&�@[�o��@[�alB�@\�G:�]@]�E<�@^�V0ɔ
@_{tosB@`1M*�D�@`��ɽ��@avU�,�@a��f�@b	�#��@b�+��@b��	��@cv
���]@c�k�&4        ?�Q�6�*�?�t��&�l?�9�E�?�a���@si�74@nn'l'�@үĦ i@�>��D@!>�O��a@$�|~u��@(�D��k�@,Ԑ��@0�K@2� -?`�@5I����@7�[�/�@:f���3�@=zG��C@?�%< �@Ad^�t��@B���o�@Dg�֔2�@E�e�L�@G��:��@I:qҏ9�@J�c"Y�y@L���>�@Nb��'O�@PSF��@P�����@Q��,3i�@R�!�u��@S�c�5��@T̃zΖ'@U�p�(5j@V��2@W�s�-h@X�g��om@Y��Hc�@Z��S�@\[�I��@]2c�C.@^2a[��@_N��_�@`7L&�e@`��!��@a[�Oޕ@a�j	nO@b���I�@cI=�[s@c��J���@dRO�%@d�'K=4@e�q�K9@f+�Xt�@f̗��@gn�i*4@h�0���@h�����}@i^�����@j�;���@j�E�h��@k[?D�5        ?�M춏j�?�j^Z�?���%!pX?�� lUM�@$���@7���@�!x���@w(��r�@ �C\�2@$���]@(Q(Lm��@,Yb=�e�@0Nh&d�@2�PYq'�@4��1��@7S�혬B@9����)@<}U]��x@?3�U#�@@���YD@Boȩ�5�@C�LV�@Em?���L@F��x�k9@H��?5�"@J.����@K�ķƒ�@M����@O:�����@P|��]�:@Q_��0�/@RF~`$�k@S0��5@T��/��@U
�P�@V�(�T@V��9���@W��$��w@X�2G�:@Y�~���@Z�� �@\�D��<@]��+^t@^Xt裪@_(�H��F@`,/�'�@`�M�r��@a2��PU�@a�#dv�@bL�С��@bۃ���c@ckVT:@@c�7n��@d�!FĒ�@e!%`�m@e���Ձ�@fI�G�{@f߾��@gv��7�g@hQ�E^�@h�o�d�@i@�S]�E@i�%���O        ?��v��?��[
^*?�E�i���@
�a��@0f�U�[@Q�	�G�@"�[j�oj@(�?��@-��X@1�w{ �@5Q��~�@8�?Rg�@<�U��`�@@F�.��@BUN6��@Dz����@F�z{H#@I���n>@Kgϟ��@M��#�z@P3O����@Q��s<cd@R֗Ky�g@T5	b�e@U����<}@W
]��ڑ@X��?`�@Y��ǡJ#@[�B��@]ߓUғ@^���uՍ@`~{��,@`�$E։@a����@b���K#@cu
k q@dR:�?E@e2n�U@f�a��#@f��[��M@g���6�@h�\ns!>@i��'}�l@j�!U��@k���e(@l����x0@m���4@n�����@o��G��@pGR�a�@p���8��@qK�L� ~@q��6s@rU4�Z[2@r۲�i:�@sc`�L�@s�;ZQƊ@tv?.���@uiA�@u��W�+@v#p�%@v��'���@w9R6>��        ?��7̀P?لpiu?귄��?����㵧@7�U�\@!Q�@�ҎE%@q��ܷ@M,���$@�̻�� @"�o��@%w,�N|@(B.fPA@+�)Tz<�@/��G�g@1T���D@35�n��@5&����@7'qe�r�@98�Jw �@;X��Y�	@=�����@?ŚF�@A�sr��@B53=�@Ch��A@D�]�JHR@E�1��@G)2_�U}@Hu��h�@IȽ^���@K!�}j�@L�.,��B@M���z@ON�d�t�@P_)����@Q���gE@Q��֪ԕ@R�����@SY	�7-@T��;�@T�V}��@U�0ے7@V{t�*�x@WJ���H@XhN�@X�R��y@Y����,Y@Z��垩�@[us��@\Qy3�N�@]/���f?@^�?�(y@^��dPnZ@_�.��D@`^+S��@`�4�9S�@aG0y�-�@a��ܔy@b3��/�@b���o�@c$9�Li@c��VZ�u        ?�v�vi�d?�tL�^�?�S C%�/?�+T�DU�@�X��U@�)[RZ�@�E���@��KH��@!OԀ9��@$�sL�@(����#:@,�OTi�o@0�+�{�@2��e�@5T(좂�@7ԅ��L=@:m��t@=<q��Y@?�N��]@Ac���@B��/Lh�@Dal�nE@E�Ǩ�@G���i46@I' Zd6/@JЙ��q�@L��G�[�@N=�Zy�@O�rRRB<@P�׷���@Q��3��@R�k�O}3@S����c�@T��$�@U��Q	k@V�q�E_�@W�n�;��@X���֜�@Y�6u�O]@Z��SR@[��<f&�@\���`��@]ō7��@^�r#�&�@_�=�	 @`���b@a'���@a����?�@b3���@b��F6@cY�uA�@c�pb��@d��2=�@ep���@e��5���@fN��-b@f�̶ł@g���x	�@h$V�Y@h�b�uV@ic�Jr�@j=�$�>@j�Z�t        ?�X�g��?��#L�?�����]�?���,Fs@*���@;�هl�@�y�ۖ]@���j{�@!�-��L@$��G�q@(^|����@,j4ةu�@0Xk�M��@2��E	XP@4�a!&g@7dPLy�@9�EڿSD@<�+=��@?I *�a�@A
�U�Ts@B{s��w�@C��/�A�@EyL��Q0@G�N��-@H�I�_��@J9�I��@K��3��@M��icg@OBj���@P���m)@Qa���ӕ@RG�+�Vn@S0���!@Tx���@U��;a�@U���c��@V�r�'6@W�L�ʘ�@X�)��@Y�d<�@Z���y@[��!���@\�m�?�@]��sIǏ@_	|Ce�@`|�״�@`����K�@a�jCx&@a�4�9^�@b2�o�Y@b�<��@cL� �v@c�"Mb�@dj�RӖh@d�	u�I@e�c���@f�B�s�@f��|O�@gE�r�<@g��֞*@hpŚ:4z@i�",To@i�%-D��        ?�ρK��?톢G=�?��d،��@
Wy��L@�j9�&,@����#@"�qJ#��@'�61�Q@-R��8Y@1��zt_�@4�w��@8rƆ��-@<��-<[@?�P<|�<@A�;m��@D���9@F@j����@H���@Jѽ�Va�@M5�1O@O��P\}@Qx���@Rd���~�@S�%�m�@U:a֗'@Vu���D�@W��l#@YQuI/�@Z����@\I&�A�@]�9�\�@_[�f%E�@`w��a�x@aDl�K>=@be��9@b�s�;@c��	�@d���-��@er��v�@fQL&27�@g2����@h@2�.b@h�NB��L@i�J�)@j�R��~C@k�/I��@l���@m�[��y@@n���jzV@o��}�@pH���P�@pǇn�{�@qG.���@q��jB��@rI�d�D@r̟��z@sP�c��&@s�z=�4@t[jM�XD@t�UMV�@uj6h
�@u��	@v|�@��        ?��FS�ς?١gۿ�?�؃ P�?���"
��@PNgN[@F��-�@ �5I�@�W���
@���ͺ@�]vf�j@"Di����@%N�_4�@(�M��@+� �Ԗ@/ol;c@1�3�ƺ[@3yB��=�@5u~��8@7��W�@9���l��@;�9ؤJ@>
��s�@@+����@AY�m��3@B��G��@C�Q��@EƱ�EN@FY"Ƕp�@G�D�o�f@I
�I��@J`R%]�b@K���yi�@M/�S@N���i��@Pu�c�@Pʇ�W�@Q��V��v@RP4r��@SFN�d@S��L@T���4l�@U|Ӊ@VN����S@W"��>@W��Tf�q@X����9#@Y�rp��@Z�_2&��@[l�� Q@\O��"@]3����.@^8�i@_uHs�z@_�@���@`m�&��@`�q^A�@a^^m�@a׭'sRB@bRIv�)@b��z4��@cJp��@c�����s@dFj�Gf�        ?�Ӥ'
�_?�ْ��C�?���D?���#�@�o?��@ˠ�ӫ�@N���_@y��Y�@!�����@%O!�O@)B�N�	@-x +��@0���7�@3M\�]jY@5�Z��@8O�M_�r@:�t�0a@=������@@I��@A��¦�@CEG��@D�pY�N�@Fl	 �B@H�����@I�@x9��@KqI��@M0�F@�R@N��W��@Pe)&0@QQ��@RC�%$�@S8X�ͫ@T1�F!2i@U/��`@V0G�0�@W5^��D2@X>;l���@YJ�|3 @Z[���@[n�4#I�@\��U��@]���u
@^��OP�o@_�[]�q@`��"y�@a��L;(@a�5��,C@bCmr;�@b�5;���@cv��%��@d[���#@d������@eNq�6f@e�"mr@f�8�e�.@g3,Y[T�@g�w;@�b@h}�(D@i$ ]4��@i�3�p�@ju��-f@k YB
o�@k�B2�|&        ?� �D�/l?���M+��?��T����?�O��*�@�b�h@E�W�@Z��dd�@A'���@ ނ��.g@$b��9��@((�B�@,,��7Y@05�5�,@2qj蟩F@4ǑG��-@77���@9���c0@<^r*@�@?ak���@@�8��@B^�/��6@C�N���Y@E[���*�@F�N"��@H}�MC�@J�πz�@K�ϛ�r@Mr-�E@O)I�?�@Pt:�Ѯr@QW��:`@R>�ii�#@S)����@TDJj��@U
R�n9�@U����	@V��Q�fL@W��"H�@X�0���@Y��(�@Z����@\���@]��D׭@^���]!@_.�s��@`!>�Z	@`�W�:�:@a8���@a�S�t��@bU)}�܋@b�4	"Ȏ@cvo���@d�T'c�@d�o�d9@e1-��S�@e���@f^+�0y@f�+^�̯@g�Z{�X�@h)��O�U@h�����W@ia���@i�Y�Ұe        ?Ѹ���F�?�lKM�v?�����@
F{�4�3@���U�l@��W�4E@"���*�W@'��� З@-T��Xq@1��r@5��y�@8�Q��'�@<2̠�m3@@
;�o[-@B��1h@D/�.��@FbB-B�@H�1	]�@KT�� *@Mp|X��H@O��JF.F@Q@��u��@R��`F@S�ᙇ�9@UN�0��@V�G�%�q@X*w�F\@Y�l祶�@[%�*�w%@\�s���@^?Z{|@�@_��	-��@`����ĳ@a�U`J�@bcd5<�@c<��-��@dlA�`@d�I\o�6@e�M�S-Q@f�i��8{@g��x��	@h���S��@i�����@jx~fi@kmͩ�y@ldo��V�@m^o}*��@n[9HP2@oZBE��@p. ;`J@p�~��@q3v�<>�@q��|�@r=ô�i@rİ���@sL�b�n!@s�k��@t`d<L�i@t����@ux'K3@v3ܽF@v���L@w$�~#��        ?�M��+�?�.v~��[?�c����?�|:��:�@�{$��@�I���@��E�v�@=k:c(@���@G,%q��@!�6�k�@$�N�x�@(\c$h�@+]3��±@.��4��@15��ՙ�@3�{e�@5�Z���@7�B���@9Hl@;6����`@=f5�T�H@?���@��@@��!�A@B&N�q�@CZ3D磰@D�Ջ;B@E�Y���@G��S�/@Hk��@�W@I��ȝYj@K*���u@Lx�Upe�@M�h�B@OG��7@P[�p{�}@Q*3��[@Q�'�P�R@R���}�@ST����@T��L�@T�v �j@U�Y�0?�@VsuF���@W@��e��@X%`��x@X� {��@Y�*L���@Z��?���@[b&���@\;��2Mr@]��L[�@]�˵P�@^ҝ�_��@_�+�q��@`J��H$@`���K�@a/s�l��@a�M}r�@b_~j�u@b�z�rM@cTƁ(�@cxꍼ        ?��a !SY?�0w�xE?��%~�w?����C�@��w+@/'�-^@}���1@n�@@ ���'�@$�;R��@(RW�yT.@,^�{R��@0S~�Te@2����:@4�Ĉ�&R@7eT:�@9��vo@<���_^�@?Vt<��@A����@B����ȴ@D���@E���9�@G 	hPv@H��Y��o@J^P�Ĵ@L
��,��@M�5-�s"@O{��@P�U�@r�@Q��h+�@Rps"@�Y@S^�@!@TO/�ؐ�@UC��|=�@V;�WU�@W7U���@X5�t��t@Y7�7o�@Z<�(j��@[D���ml@\O�f��@]]C��w@^m����5@_�K��e4@`K���	�@`�/$,��@ae����@a�E�[�@b�����y@cC�.�@c�H82vF@d>�D["@d�-�@ej���E3@fֶp9�@f����@g6^�Vȿ@g��HҴ�@hn�mJ�@iN�`�Y@i�-�L��@jK \���        ?�$+��#?��]|�??��W	4��?�q�x�@%�=�1@(�x��Q@v�4���@e��:t@ �zK^��@$~�����@(J01��@,Tu��ՙ@0M-�@2�F�?�@4�p��?|@7Zjm�ʅ@9�#4�@<���e![@?F�]�8U@A��@BRG��@C���`@E��~��@G��݉"@H�1^��v@JP��M|�@K�j��ۈ@M�[[�@Oi(�ˌ@P���7�y@Qz�}�)�@RcS�X�@SN�:�n@T> 4�rd@U0^��ͬ@V%�}��c@W�qg��@X��7[@Y�R�?@Z1	�@[\��h @\%](W> @]/J�s�@^;t��o@_Js�G?@`.5���@`�4�@aCZ�zuK@a��\Q��@b]��q 
@b�k�
��@c|nx^�M@d�"Z2@d����Qr@e3��sr@eǀ��X�@f\�a�-�@f�e[I�r@g����Y}@h#\���@h����w@iWU~�d%@i��r�        ?�j��?�s��ܽ�?��KD?�L@	l�}�|�@AJ�{]�@�s[,A@!�����@&���Yb�@,]�9~��@1#���M@4O���@7�;�(Y@;?I�c47@>�z2 �}@As�8l�"@C}�+��s@E�5���@G͑!6f@J�^��@Lh#�v��@N��8�@P�|r���@Q�B蓳�@S6KL�@T�שL	�@U�:8��@WK_��.@X�2n�� @Z(h���V@[����w(@]!f���X@^���Q6�@`W�k2@`������@a�x�kf@b��E�@cRz�	�@d'ô�@d�Ү���@eژ��1@f�Ҋ��@g�� @hz�=]�4@i_˯�v�@jG\�;��@k1T�ڈ@l��#�@m>����@m�m*��@n�xA��@o�.��@pn-��O�@p��x>2@qh\J1WK@q��<��M@rffK@r���>��@sh$z���@s�\�>Q@tmsAq�@t�e����@uv/n�"�@u��m��